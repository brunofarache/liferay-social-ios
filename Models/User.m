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

#import "User.h"

/**
 * @author Bruno Farache
 */
@implementation User

- (id)init:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.emailAddress = [jsonObj objectForKey:@"emailAddress"];
		self.fullName = [jsonObj objectForKey:@"fullName"];
		self.portalUser = [[jsonObj objectForKey:@"portalUser"] boolValue];

		if (self.portalUser) {
			self.block = [[jsonObj objectForKey:@"block"] boolValue];
			self.connected = [[jsonObj objectForKey:@"connected"] boolValue];
			self.connectionRequested =
				[[jsonObj objectForKey:@"connectionRequested"] boolValue];

			self.contactId =
				[[jsonObj objectForKey:@"contactId"] longLongValue];

			self.firstName = [jsonObj objectForKey:@"firstName"];
			self.following = [[jsonObj objectForKey:@"following"] boolValue];
			self.jobTitle = [jsonObj objectForKey:@"jobTitle"];
			self.lastName = [jsonObj objectForKey:@"lastName"];
			self.portraitId =
				[[jsonObj objectForKey:@"portraitId"] longLongValue];

			self.userId = [[jsonObj objectForKey:@"userId"] longLongValue];
			self.uuid = [jsonObj objectForKey:@"uuid"];
		}
		else {
			self.comments = [jsonObj objectForKey:@"comments"];
			self.entryId = [[jsonObj objectForKey:@"entryId"] longLongValue];
		}
	}

	return self;
}

@end