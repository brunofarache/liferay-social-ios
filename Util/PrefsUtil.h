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

#import "LRBatchSession.h"

/**
 * @author Bruno Farache
 */
#define LOGIN		@"login"
#define PASSWORD	@"password"
#define SERVER		@"server"

@interface PrefsUtil : NSObject

+ (LRBatchSession *)getBatchSession:(id<LRCallback>)callback;
+ (NSString *)getLogin;
+ (NSString *)getPassword;
+ (NSString *)getServer;
+ (LRSession *)getSession;
+ (LRSession *)getSession:(id<LRCallback>)callback;
+ (void)setLogin:(NSString *)login;
+ (void)setPassword:(NSString *)password;
+ (void)setServer:(NSString *)server;

@end