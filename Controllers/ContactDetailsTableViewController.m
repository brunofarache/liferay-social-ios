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

#import "ContactDetailsTableViewController.h"

/**
 * @author Bruno Farache
 */
@implementation ContactDetailsTableViewController

- (id)init:(User *)user {
	self = [super initWithStyle:UITableViewStyleGrouped];

	if (self) {
		self.user = user;
		self.title = user.firstName;
	}

	return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section {

	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell =
		[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		cell =
			[[UITableViewCell alloc]
				initWithStyle:UITableViewCellStyleDefault
				reuseIdentifier:CellIdentifier];
	}

	if (indexPath.section == 0) {
//		[cell.textLabel setText:self.user.phone.number];
	}
	else if (indexPath.section == 1) {
		[cell.textLabel setText:self.user.emailAddress];
	}
	else if (indexPath.section == 2) {
		[cell.textLabel setText:@"Add to contacts"];
	}

	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *action;

	if (indexPath.section == 0) {
//		action = [NSString stringWithFormat:@"tel:%@", self.user.phone.number];
	}
	else if (indexPath.section == 1) {
		action =
			[NSString stringWithFormat:@"mailto:%@", self.user.emailAddress];
	}

	NSURL *URL = [NSURL URLWithString:action];

	[[UIApplication sharedApplication] openURL:URL];
}

@end