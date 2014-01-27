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

#define INVALID_GROUP_ID -1

static NSMutableArray *_folderPath;
static NSUserDefaults *_userDefaults;

@implementation PrefsUtil

+ (void)initialize {
	if (!_folderPath) {
		_folderPath = [[NSMutableArray alloc] init];
	}

	if (!_userDefaults) {
		_userDefaults = [NSUserDefaults standardUserDefaults];
	}
}

+ (NSString *)encodeURL:(NSString *)string {
	NSString *newString =
		CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
			kCFAllocatorDefault, (CFStringRef)string, NULL,
			CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"),
			CFStringConvertNSStringEncodingToEncoding(
				NSUTF8StringEncoding)));

	if (newString) {
		return newString;
	}

	return @"";
}

+ (NSString *)getEmail {
	return @"test@liferay.com";
//	return [_userDefaults stringForKey:@"email"];
}

+ (NSString *)getFolderPath {
	NSString *folderPath = @"";

	for (NSString *key in _folderPath) {
		NSArray *names = [key componentsSeparatedByString:@"#"];

		NSString *name = [names objectAtIndex:1];

		name = [self encodeURL:name];

		folderPath = [folderPath stringByAppendingFormat:@"%@/", name];
	}

	return folderPath;
}

+ (NSString *)getGroupFriendlyURL {
	return [_userDefaults objectForKey:@"groupFriendlyURL"];
}

+ (NSNumber *)getGroupId {
	return @(10184);
//	return [_userDefaults objectForKey:@"groupId"];
}

+ (NSString *)getPassword {
	return @"test";
//	return [_userDefaults stringForKey:@"password"];
}

+ (CGRect)getScreenFrame {
	return [self getScreenFrame:nil];
}

+ (CGRect)getScreenFrame:(UIDeviceOrientation)orientation {
	if (!orientation) {
		orientation = [UIApplication sharedApplication].statusBarOrientation;
	}

	CGRect frame = [[UIScreen mainScreen] bounds];

	if (UIDeviceOrientationIsLandscape(orientation)) {
		frame = CGRectMake(0, 0, frame.size.height, frame.size.width);
	}

	return frame;
}

+ (NSString *)getServer {
	return @"http://localhost:8080";
//	return [_userDefaults stringForKey:@"server"];
}

+ (LRSession *)getSession {
	NSString *server = [self getServer];
	NSString *email = [self getEmail];
	NSString *password = [self getPassword];

	return [[LRSession alloc] init:server username:email password:password];
}

+ (BOOL)isTrustCertificate {
	NSString *server = [self getServer];

	if (!server) {
		return NO;
	}

	return [_userDefaults objectForKey:server];
}

+ (BOOL)needsSetup {
	NSString *email = [self getEmail];
	NSString *password = [self getPassword];
	NSString *server = [self getServer];

	return ([Validator isNull:email] || [Validator isNull:password] ||
		[Validator isNull:server]);
}

+ (BOOL)reloadUserSites {
	long groupId = [[self getGroupId] longValue];

	return (groupId == INVALID_GROUP_ID);
}

+ (void)saveEmail:(NSString *)email {
	[_userDefaults setObject:email forKey:@"email"];

	[_userDefaults synchronize];
}

+ (void)savePassword:(NSString *)password {
	[_userDefaults setObject:password forKey:@"password"];

	[_userDefaults synchronize];
}

+ (void)saveServer:(NSString *)server {
	if (!([server hasPrefix:@"http://"] || [server hasPrefix:@"https://"])) {
		server = [NSString stringWithFormat:@"http://%@", server];
	}

	[_userDefaults setObject:server forKey:@"server"];

	[_userDefaults synchronize];
}

+ (void)setTrustCertificate:(BOOL)trustCertificate {
	NSString *server = [self getServer];

	[_userDefaults setBool:trustCertificate forKey:server];

	[_userDefaults synchronize];
}

+ (void)updateFolderPath:(long)folderId folderName:(NSString *)folderName {
	if (folderId == 0) {
		_folderPath = [[NSMutableArray alloc] init];

		return;
	}

	NSString *key = [NSString stringWithFormat:@"%ld#%@", folderId, folderName];

	int index = [_folderPath indexOfObject:key];

	if (index == NSNotFound) {
		[_folderPath addObject:key];
	}
	else {
		int toIndex = index + 1;

		if (toIndex < [_folderPath count]) {
			[_folderPath removeLastObject];
		}
	}
}

@end