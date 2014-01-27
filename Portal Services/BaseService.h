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

#import "HandleException.h"
#import "JSON.h"
#import "PrefsUtil.h"
#import "UIView+Loading.h"

/**
 * @author Bruno Farache
 */

typedef enum {
	CertificateError
} ErrorTag;

@interface BaseService : NSObject

+ (NSString *)getCommand:(NSString *)serviceName
	methodName:(NSString *)methodName;

+ (NSString *)getURL:(NSString *)serviceName methodName:(NSString *)methodName;
+ (id)handleException:(NSString *)response view:(UIView *)view;

+ (void)showErrorMessage:(NSError *)error view:(UIView *)view;
+ (void)showFailMessage:(NSString *)message view:(UIView *)view;

+ (void)showMessage:(NSString *)message view:(UIView *)view
	image:(UIImage *)image;

+ (void)showSuccessMessage:(NSString *)message view:(UIView *)view;

@end