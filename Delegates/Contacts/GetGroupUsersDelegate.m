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

#import "GetGroupUsersDelegate.h"

/**
 * @author Bruno Farache
 */

@implementation GetGroupUsersDelegate

- (id)init:(ContactsTableViewController *)viewController {
	self = [super init];

	if (self) {
		self.viewController = viewController;
	}

	return self;
}

- (void)requestFailed:(NSError *)error type:(int)type {
	NSLog(@"%@", error);
}

- (void)requestFinished:(NSString *)response type:(int)type {
	NSArray *jsonArray =
		[BaseService handleException:response
			view:self.viewController.tableView];

	self.viewController.entries = [self toArray:jsonArray];

	[self.viewController.tableView reloadData];
}

- (NSMutableArray *)toArray:(NSArray *)jsonArray {
	NSMutableArray *users = [NSMutableArray array];

	for (NSDictionary *jsonObj in jsonArray) {
		User *user = [[User alloc] initWithJSON:jsonObj];

		[users addObject:user];
	}

	return users;
}

@end