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

#import "UserModel.h"

/**
 * @author Bruno Farache
 */

@implementation UserModel

- (id)initWithJSON:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.companyId = [[jsonObj objectForKey:@"companyId"] longValue];
		self.contactId = [[jsonObj objectForKey:@"contactId"] longValue];

		self.createDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"createDate"]];

		self.emailAddress = [jsonObj objectForKey:@"emailAddress"];
		self.facebookId = [[jsonObj objectForKey:@"facebookId"] longValue];
		self.firstName = [jsonObj objectForKey:@"firstName"];
		self.greeting = [jsonObj objectForKey:@"greeting"];
		self.jobTitle = [jsonObj objectForKey:@"jobTitle"];
		self.languageId = [jsonObj objectForKey:@"languageId"];

		self.lastLoginDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"lastLoginDate"]];

		self.lastName = [jsonObj objectForKey:@"lastName"];
		self.middleName = [jsonObj objectForKey:@"middleName"];
		self.portraitId = [[jsonObj objectForKey:@"portraitId"] longValue];
		self.screenName = [jsonObj objectForKey:@"screenName"];
		self.timeZoneId = [jsonObj objectForKey:@"timeZoneId"];
		self.userId = [[jsonObj objectForKey:@"userId"] longValue];
		self.uuid = [jsonObj objectForKey:@"uuid"];
	}

	return self;
}

- (NSDate *)convertNumberToDate:(NSNumber *)number {
	NSString *modifiedDate = [number stringValue];

	modifiedDate = [modifiedDate substringToIndex:(modifiedDate.length - 3)];

	return [NSDate dateWithTimeIntervalSince1970:[modifiedDate longLongValue]];
}

@end