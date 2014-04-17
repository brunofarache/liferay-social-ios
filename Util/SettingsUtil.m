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

#import "SettingsUtil.h"

static LRSession *_session;
static NSUserDefaults *_settings;

/**
 * @author Bruno Farache
 */
@implementation SettingsUtil

+ (void)initialize {
	if (!_settings) {
		_settings = [NSUserDefaults standardUserDefaults];
	}
}

+ (LRBatchSession *)getBatchSession:(id<LRCallback>)callback {
	return [[LRBatchSession alloc] init:[self getSession:callback]];
}

+ (long)getCompanyId {
	return [[_settings objectForKey:COMPANY_ID] longValue];
}

+ (NSString *)getPassword {
	NSURLCredential *credential = [self _getCredential:[self getServer]];
	return credential.password;
}

+ (NSString *)getServer {
	NSString *value = [_settings stringForKey:SERVER];
	return value;
}

+ (LRSession *)getSession {
	return [self getSession:nil];
}

+ (LRSession *)getSession:(id<LRCallback>)callback {
	NSString *server = [self getServer];
	NSString *username = [self getUsername];
	NSString *password = [self getPassword];

	_session = [[LRSession alloc] init:server username:username
		password:password];

	[_session setCallback:callback];

	return _session;
}

+ (NSString *)getUsername {
	NSURLCredential *credential = [self _getCredential:[self getServer]];
	return credential.user;
}

+ (BOOL)isSignedIn {
	return [self getUsername] ? YES : NO;
}

+ (void)setCredentialsWithUsername:(NSString *)username
		password:(NSString *)password companyId:(NSNumber *)companyId
		server:(NSString *)server {

	if (!([server hasPrefix:@"http://"] || [server hasPrefix:@"https://"])) {
		server = [NSString stringWithFormat:@"http://%@", server];
	}

	NSURLCredential *credential = [NSURLCredential credentialWithUser:username
		password:password persistence:NSURLCredentialPersistencePermanent];

	NSURLProtectionSpace *space = [self _getProtectionSpace:server];

	[[NSURLCredentialStorage sharedCredentialStorage] setCredential:credential
		forProtectionSpace:space];

	[_settings setObject:companyId forKey:COMPANY_ID];
	[_settings setObject:server forKey:SERVER];
	[_settings synchronize];
}

+ (NSURLCredential *)_getCredential:(NSString *)server {
	NSURLProtectionSpace *space = [self _getProtectionSpace:server];

	NSDictionary *credentialStorage =
		[[NSURLCredentialStorage sharedCredentialStorage]
			credentialsForProtectionSpace:space];

	NSString *username = credentialStorage.keyEnumerator.nextObject;

	return credentialStorage[username];
}

+ (NSURLProtectionSpace *)_getProtectionSpace:(NSString *)server {
	NSURL *URL = [NSURL URLWithString:server];

	return [[NSURLProtectionSpace alloc] initWithHost:URL.host
		port:[URL.port integerValue] protocol:URL.scheme realm:nil
		authenticationMethod:NSURLAuthenticationMethodHTTPDigest];
}

@end