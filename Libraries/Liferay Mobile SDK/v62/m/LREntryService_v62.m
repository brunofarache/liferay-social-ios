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

#import "LREntryService_v62.h"

/**
 * @author Bruno Farache
 */
@implementation LREntryService_v62

- (NSArray *)searchUsersAndContactsWithCompanyId:(long long)companyId keywords:(NSString *)keywords start:(int)start end:(int)end error:(NSError **)error {
	NSDictionary *_params = @{
		@"companyId": @(companyId),
		@"keywords": keywords,
		@"start": @(start),
		@"end": @(end)
	};

	NSDictionary *_command = @{@"/contacts-portlet/entry/search-users-and-contacts": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

@end