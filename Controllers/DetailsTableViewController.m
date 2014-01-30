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

#import "DetailsTableViewController.h"

/**
 * @author Bruno Farache
 */
@implementation DetailsTableViewController

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
	return 4;
}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

	if (section == 3) {
		NSArray *phones = self.user.contact.phones;

		if ([phones count] == 0) {
			return 1;
		}

		return [phones count];
	}

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

	NSString *text = @"";

	if (indexPath.section == 0) {
		text = self.user.fullName;
	}
	else if (indexPath.section == 1) {
		text = self.user.contact.emailAddress;
	}
	else if (indexPath.section == 2) {
		text = self.user.contact.birthday;
	}
	else {
		NSArray *phones = self.user.contact.phones;

		if ([phones count] > 0) {
			text = [phones objectAtIndex:indexPath.row];
		}
	}

	[cell.textLabel setText:text];

	return cell;
}

- (NSString *)tableView:(UITableView *)tableView
		titleForHeaderInSection:(NSInteger)section {

	if (section == 0) {
		return @"Name";
	}
	else if (section == 1) {
		return @"Email";
	}
	else if (section == 2) {
		return @"Birthday";
	}
	else {
		return @"Phones";
	}
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *action;

	if (indexPath.section == 1) {
		action =
			[NSString stringWithFormat:@"mailto:%@", self.user.emailAddress];
	}
	else if (indexPath.section == 3) {
		action =
			[NSString stringWithFormat:@"tel:%@",
				self.user.contact.phones[indexPath.row]];
	}

	NSURL *URL = [NSURL URLWithString:action];

	[[UIApplication sharedApplication] openURL:URL];
}

@end