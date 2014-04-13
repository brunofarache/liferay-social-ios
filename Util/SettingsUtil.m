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
static NSUserDefaults *_preferences;

/**
 * @author Bruno Farache
 */
@implementation SettingsUtil

+ (void)initialize {
	if (!_preferences) {
		_preferences = [NSUserDefaults standardUserDefaults];
	}
}

+ (LRBatchSession *)getBatchSession:(id<LRCallback>)callback {
	return [[LRBatchSession alloc] init:[self getSession:callback]];
}

+ (long)getCompanyId {
	return [[_preferences objectForKey:COMPANY_ID] longValue];
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
	NSString *server = [self getServer];
	NSString *username = [self getUsername];
	NSString *password = [self getPassword];

	_session = [[LRSession alloc] init:server username:username
		password:password];

	[_session setCallback:callback];

	return _session;
}

+ (NSString *)getUsername {
	return @"test@liferay.com";
}

+ (void)setPassword:(NSString *)password {
	[_preferences setObject:password forKey:PASSWORD];
	[_preferences synchronize];
}

+ (void)setCompanyId:(NSNumber *)companyId {
	[_preferences setObject:companyId forKey:COMPANY_ID];
	[_preferences synchronize];
}

+ (void)setServer:(NSString *)server {
	if (!([server hasPrefix:@"http://"] || [server hasPrefix:@"https://"])) {
		server = [NSString stringWithFormat:@"http://%@", server];
	}

	[_preferences setObject:server forKey:SERVER];
	[_preferences synchronize];
}

+ (void)setUsername:(NSString *)username {
	[_preferences setObject:username forKey:username];
	[_preferences synchronize];
}

@end