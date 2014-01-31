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

#import "Contact.h"

/**
 * @author Bruno Farache
 */
@implementation Contact

- (id)init:(NSArray *)jsonArray {
	self = [super init];

	if (self) {
		NSDictionary *contact = [jsonArray objectAtIndex:0];
		self.emailAddress = [contact objectForKey:@"emailAddress"];

		NSArray *phones = [jsonArray objectAtIndex:1];
		self.phones = [[NSMutableArray alloc] init];

		for (NSDictionary *phone in phones) {
			[self.phones addObject:[phone objectForKey:@"number"]];
		}

		NSNumber *timeInterval = [contact objectForKey:@"birthday"];

		if ([timeInterval longValue] > 0) {
			NSDate *birthday = [DateUtil convertNumberToDate:timeInterval];

			NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

			[formatter setDateStyle:NSDateFormatterLongStyle];
			[formatter setTimeStyle:NSDateFormatterNoStyle];

			self.birthday = [formatter stringFromDate:birthday];
		}
	}

	return self;
}

@end