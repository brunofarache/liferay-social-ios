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

#import "PhoneService.h"

/**
 * @author Bruno Farache
 */

static NSString *_serviceName = @"phone";

@implementation PhoneService

+ (NSArray *)getPhones:(long)contactId {
	NSString *key = [self getCommand:@"get-phones"];

	NSDictionary *value = @{
		@"className": @"com.liferay.portal.model.Contact",
		@"classPk": @(contactId)
	};

	NSDictionary *command = @{ key: value };

	NSArray *jsonArray = [HttpClient sendSyncRequest:command];

	NSMutableArray *phones = [NSMutableArray array];

	for (NSDictionary *phone in jsonArray) {
		[phones addObject:[[Phone alloc] initWithJSON:phone]];
	}

	return phones;
}

+ (NSString *)getCommand:(NSString *)methodName {
	return [self getCommand:_serviceName methodName:methodName];
}

@end