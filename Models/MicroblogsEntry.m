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

#import "MicroblogsEntry.h"

/**
 * @author Bruno Farache
 */

@implementation MicroblogsEntry

- (id)initWithJSON:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.companyId = [[jsonObj objectForKey:@"companyId"] longValue];
		self.content = [jsonObj objectForKey:@"content"];

		self.createDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"createDate"]];

		self.microblogsEntryId =
			[[jsonObj objectForKey:@"microblogsEntryId"] longValue];

		self.modifiedDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"modifiedDate"]];

		self.receiverMicroblogsEntryId =
			[[jsonObj objectForKey:@"receiverMicroblogsEntryId"] longValue];

		self.receiverUserId =
			[[jsonObj objectForKey:@"receiverUserId"] longValue];

		self.socialRelationType =
			[[jsonObj objectForKey:@"socialRelationType"] intValue];

		self.type = [[jsonObj objectForKey:@"type"] intValue];
		self.userId = [[jsonObj objectForKey:@"userId"] longValue];
		self.userName = [jsonObj objectForKey:@"userName"];
	}

	return self;
}

- (NSDate *)convertNumberToDate:(NSNumber *)number {
	NSString *modifiedDate = [number stringValue];

	modifiedDate = [modifiedDate substringToIndex:(modifiedDate.length - 3)];

	return [NSDate dateWithTimeIntervalSince1970:[modifiedDate longLongValue]];
}

@end