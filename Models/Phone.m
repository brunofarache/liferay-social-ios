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

#import "Phone.h"

/**
 * @author Bruno Farache
 */
@implementation Phone

- (id)initWithJSON:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.extension = [jsonObj objectForKey:@"extension"];
		self.number = [jsonObj objectForKey:@"number"];
		self.phoneId = [[jsonObj objectForKey:@"phoneId"] longValue];
		self.primary = [[jsonObj objectForKey:@"primary"] boolValue];
	}

	return self;
}

@end