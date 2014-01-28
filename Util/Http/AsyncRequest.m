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