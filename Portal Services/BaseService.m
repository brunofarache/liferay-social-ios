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

#import "BaseService.h"

/**
 * @author Bruno Farache
 */

#define INVALID_CERTIFICATE_CODE -1202

@implementation BaseService

+ (NSString *)getCommand:(NSString *)serviceName
		methodName:(NSString *)methodName {

	return [NSString stringWithFormat:@"/%@/%@", serviceName, methodName];
}

+ (NSString *)getURL:(NSString *)serviceName methodName:(NSString *)methodName {
	NSString *URL =
		[NSString stringWithFormat:@"api/jsonws/%@/%@", serviceName,
			methodName];

	return URL;
}

+ (id)handleException:(NSString *)response view:(UIView *)view {
	SBJsonParser *parser = [[SBJsonParser alloc] init];

	id jsonObj = [parser objectWithString:response];

	if ([jsonObj isKindOfClass:[NSDictionary class]]) {
		NSString *exception = [jsonObj objectForKey:@"exception"];

		if (exception) {
			NSString *exceptionMessage =
				[HandleException stringForException:exception];

			jsonObj = nil;

			if (view) {
				[self showFailMessage:exceptionMessage view:view];
			}
		}
	}

	return jsonObj;
}

+ (void)showErrorMessage:(NSError *)error view:(UIView *)view {
	NSString *message = [error localizedDescription];
	NSInteger code = [error code];

	switch (code) {
		case NSURLErrorUserCancelledAuthentication:
			message = NSLocalizedString(@"wrong-credentials", nil);

			break;

		case NSURLErrorCancelled:
			message = NSLocalizedString(@"download-cancelled", nil);

			break;
	}

	[self showFailMessage:message view:view];
}

+ (void)showFailMessage:(NSString *)message view:(UIView *)view {
	UIImage *image = [UIImage imageNamed:@"close.png"];

	[self showMessage:message view:view image:image];
}

+ (void)showMessage:(NSString *)message view:(UIView *)view
		image:(UIImage *)image {

	UIView *customView = [[UIImageView alloc] initWithImage:image];

	[view showMessageHUD:message customView:customView];
}

+ (void)showSuccessMessage:(NSString *)message view:(UIView *)view {
	UIImage *image = [UIImage imageNamed:@"checkmark.png"];

	[self showMessage:message view:view image:image];
}

@end