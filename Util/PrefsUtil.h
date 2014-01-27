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

#import "LRCallback.h"
#import "LRSession.h"
#import "Validator.h"

/**
 * @author Bruno Farache
 */

@interface PrefsUtil : NSObject

+ (NSString *)encodeURL:(NSString *)string;
+ (NSString *)getEmail;
+ (NSString *)getFolderPath;
+ (NSString *)getGroupFriendlyURL;
+ (NSNumber *)getGroupId;
+ (NSString *)getPassword;
+ (CGRect)getScreenFrame;
+ (CGRect)getScreenFrame:(UIDeviceOrientation)orientation;
+ (NSString *)getServer;
+ (LRSession *)getSession;
+ (LRSession *)getSession:(id<LRCallback>)callback;
+ (BOOL)isTrustCertificate;
+ (BOOL)needsSetup;
+ (BOOL)reloadUserSites;
+ (void)saveEmail:(NSString *)email;
+ (void)savePassword:(NSString *)password;
+ (void)saveServer:(NSString *)server;
+ (void)setTrustCertificate:(BOOL)trustCertificate;
+ (void)updateFolderPath:(long)folderId folderName:(NSString *)folderName;

@end