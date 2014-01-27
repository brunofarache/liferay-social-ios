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

#import "PrefsUtil.h"

/**
 * @author Bruno Farache
 */

static LRSession *_session;
static NSUserDefaults *_userDefaults;

@implementation PrefsUtil

+ (NSNumber *)getGroupId {
	return @(10184);
}

+ (NSString *)getLogin {
	return @"test@liferay.com";
}

+ (NSString *)getPassword {
	return @"test";
}

+ (NSString *)getServer {
	return @"http://localhost:8080";
}

+ (LRSession *)getSession {
	return [self getSession:nil];
}

+ (LRSession *)getSession:(id<LRCallback>)callback {
	if (!_session) {
		NSString *server = [self getServer];
		NSString *email = [self getLogin];
		NSString *password = [self getPassword];

		_session = [[LRSession alloc] init:server username:email
			password:password];
	}

	[_session setCallback:callback];

	return _session;
}

+ (void)setLogin:(NSString *)login {
	[_userDefaults setObject:login forKey:login];
	[_userDefaults synchronize];

	_session = nil;
}

+ (void)setPassword:(NSString *)password {
	[_userDefaults setObject:password forKey:PASSWORD];
	[_userDefaults synchronize];

	_session = nil;
}

+ (void)setServer:(NSString *)server {
	if (!([server hasPrefix:@"http://"] || [server hasPrefix:@"https://"])) {
		server = [NSString stringWithFormat:@"http://%@", server];
	}

	[_userDefaults setObject:server forKey:SERVER];
	[_userDefaults synchronize];

	_session = nil;
}

@end