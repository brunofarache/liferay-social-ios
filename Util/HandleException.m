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

/**
 * @author Josiane Bezerra
 */

@implementation HandleException

+ (NSString *)stringForException:(NSString *)error {
	NSArray *errorParts = [error componentsSeparatedByString:@":"];

	NSString *lastErrorPart = @"";

	if ([errorParts count] > 1) {
		lastErrorPart = [errorParts lastObject];
	}

	NSString *firstErrorPart = [errorParts objectAtIndex:0];

	NSArray *exceptionParts = [firstErrorPart componentsSeparatedByString:@"."];

	error = [exceptionParts lastObject];

	NSRegularExpression *regex =
		[NSRegularExpression regularExpressionWithPattern:@"\\B[A-Z]"
			options:NSRegularExpressionSearch error:nil];

	NSArray *matches = [regex matchesInString:error options:0
		range:NSMakeRange(0, [error length])];

	NSMutableString *mutableException =
		[NSMutableString stringWithString:error];

	for (int i = 0; i < [matches count]; i++) {
		NSRange matchRange = [[matches objectAtIndex:i] range];

		[mutableException insertString:@" " atIndex:(matchRange.location + i)];
	}

	if ([lastErrorPart length]) {
		error = [NSString stringWithFormat:@"%@:%@", mutableException,
			lastErrorPart];

		return error;
	}

	return mutableException;
}

@end