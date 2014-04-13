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

#import "SignInViewController.h"

/**
 * @author Bruno Farache
 */
@implementation SignInViewController

- (id)init {
	return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

	if (section == 0) {
		return 3;
	}

	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	UITableViewCell *cell = [[UITableViewCell alloc]
		initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

	if (indexPath.section == 0) {
		UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(
			10, 10, cell.bounds.size.width, cell.bounds.size.height)];

		if (indexPath.row == 0) {
			[field setPlaceholder:@"e-mail"];
			[field setKeyboardType:UIKeyboardTypeEmailAddress];
			[field setTag:0];
		}
		else if (indexPath.row == 1) {
			[field setPlaceholder:@"password"];
			[field setSecureTextEntry:YES];
			[field setTag:1];
		}
		else {
			[field setPlaceholder:@"server"];
			[field setKeyboardType:UIKeyboardTypeURL];
			[field setTag:2];
		}

		[field setDelegate:self];
		[cell.contentView addSubview:field];
	}
	else {
		[cell.textLabel setText:@"Sign In"];
		[cell.textLabel setTextAlignment:NSTextAlignmentCenter];
	}

	return cell;
}

- (NSString *)tableView:(UITableView *)tableView
		titleForHeaderInSection:(NSInteger)section {

	if (section == 0) {
		return @"Credentials";
	}

	return @"";
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	int tag = textField.tag;

	if (tag == 0 || tag == 1) {
		[[self.tableView viewWithTag:(tag + 1)] becomeFirstResponder];
	}
	else if (tag == 2) {
		[textField resignFirstResponder];
	}

	return YES;
}

@end