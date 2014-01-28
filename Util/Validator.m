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

#import "Validator.h"

/**
 * @author Bruno Farache
 */
@implementation Validator

+ (BOOL)isNull:(NSString *)string {
	if ((string == nil) || [string isKindOfClass:[NSNull class]]) {
		return YES;
	}

	NSCharacterSet *whitespace = [NSCharacterSet whitespaceCharacterSet];

	string = [string stringByTrimmingCharactersInSet:whitespace];

	if (string.length == 0) {
		return YES;
	}

	return NO;
}

@end