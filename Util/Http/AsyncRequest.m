/**
 * Copyright (c) 2000-2014 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

#import "AsyncRequest.h"

/**
 * @author Josiane Bezerra
 * @author Bruno Farache
 */

@implementation AsyncRequest

- (id)initWithRequest:(NSURLRequest *)request {
	self = [self initWithRequest:request download:NO];

	return self;
}

- (id)initWithRequest:(NSURLRequest *)request download:(BOOL)download {
	self = [super initWithRequest:request];

	if (self) {
		NSString *trust = NSURLAuthenticationMethodServerTrust;

		BOOL (^ protectionBlock)(NSURLConnection *, NSURLProtectionSpace *) =
			^(NSURLConnection *connection, NSURLProtectionSpace *space) {
				if (![space.authenticationMethod isEqualToString:trust]) {
					return YES;
				}

				return [PrefsUtil isTrustCertificate];
			};

		void (^ authBlock)(NSURLConnection *, NSURLAuthenticationChallenge *);

		if (download) {
			authBlock = [self getDownloadAuthBlock];
		}
		else {
			authBlock = [self getAuthBlock];
		}

		[self setAuthenticationAgainstProtectionSpaceBlock:protectionBlock];
		[self setAuthenticationChallengeBlock:authBlock];
	}

	return self;
}

- (void (^)(NSURLConnection *, NSURLAuthenticationChallenge *))getAuthBlock {

	return  ^(NSURLConnection *conn, NSURLAuthenticationChallenge *challenge) {
		NSString *method = challenge.protectionSpace.authenticationMethod;
		NSString *trust = NSURLAuthenticationMethodServerTrust;

		if ([method isEqualToString:trust]) {
			SecTrustRef serverTrust = challenge.protectionSpace.serverTrust;

			NSURLCredential *credential =
				[NSURLCredential credentialForTrust:serverTrust];

			[self useCredential:credential challenge:challenge];
		}
		else {
			if ([challenge previousFailureCount] == 0) {
				[self useCredential:challenge];
			}
			else {
				[challenge.sender cancelAuthenticationChallenge:challenge];
			}
		}
	};
}

- (void (^)(NSURLConnection *, NSURLAuthenticationChallenge *))
		getDownloadAuthBlock {

	return ^(NSURLConnection *conn, NSURLAuthenticationChallenge *challenge) {
		[self useCredential:challenge];
	};
}

- (void)useCredential:(NSURLAuthenticationChallenge *)challenge {
	NSString *user = [PrefsUtil getEmail];
	NSString *password = [PrefsUtil getPassword];

	NSURLCredential *credential =
		[NSURLCredential credentialWithUser:user password:password
			persistence:NSURLCredentialPersistenceNone];

	[self useCredential:credential challenge:challenge];
}

- (void)useCredential:(NSURLCredential *)credential
		challenge:(NSURLAuthenticationChallenge *)challenge {

	[challenge.sender useCredential:credential
		forAuthenticationChallenge:challenge];
}

- (void)setDelegate:(id<AsyncRequestDelegate>)delegate {
	[self setDelegate:delegate loadingView:nil];
}

- (void)setDelegate:(id<AsyncRequestDelegate>)delegate
		loadingView:(UIView *)loadingView {

	_delegate = delegate;

	[loadingView showLoadingHUD];

	void (^ success)(AFHTTPRequestOperation *, id) =
		^(AFHTTPRequestOperation *operation, id responseObject) {
			NSString *response =
				[[NSString alloc]
					initWithData:responseObject encoding:NSUTF8StringEncoding];

			[loadingView hideLoadingHUD];

			[self.delegate requestFinished:response type:self.tag];
		};

	void (^ failure)(AFHTTPRequestOperation *, NSError *) =
		^(AFHTTPRequestOperation *operation, NSError *error) {
			[loadingView hideLoadingHUD];

			[self.delegate requestFailed:error type:self.tag];
		};

	[self setCompletionBlockWithSuccess:success failure:failure];
}

- (void)setProgressDelegate:(ProgressDelegate *)delegate {
	_progressDelegate = delegate;

	void (^ progressBlock)(NSUInteger, long long, long long) =
		^(NSUInteger bytes, long long sent, long long total) {
			float progress = (float)sent / (float)total;

			[delegate setProgress:progress];
		};

	if (self.tag == DownloadRequest) {
		[self setDownloadProgressBlock:progressBlock];
	}
	else if (self.tag == AddEntryRequest) {
		[self setUploadProgressBlock:progressBlock];
	}
}

@end