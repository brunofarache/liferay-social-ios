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

#import "UsersTableViewController.h"
#import "GetDetailsCallback.h"
#import "GetUsersCallback.h"

/**
 * @author Bruno Farache
 */
@implementation UsersTableViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];

	if (self) {
		self.title = @"Contacts";
		self.tabBarItem.image = [UIImage imageNamed:@"first"];
	}

	return self;
}

- (void)viewDidLoad {
	[ProgressView show:self];

	GetUsersCallback *callback = [[GetUsersCallback alloc] init:self];
	LRSession *session = [SettingsUtil getSession:callback];

	LREntryService_v62 *service =
		(LREntryService_v62 *)
			[LRServiceFactory getService:[LREntryService_v62 class]
				session:session];

	NSError *error;
	[service searchUsersAndContactsWithCompanyId:10157 keywords:@"" start:-1
		end:-1 error:&error];
}

- (void)setUsers:(NSMutableArray *)entries {
	_users = entries;
	[self.tableView reloadData];
}

- (void)showDetails:(User *)user {
	DetailsTableViewController *detailsController =
		[[DetailsTableViewController alloc] init:user];

	[self.navigationController pushViewController:detailsController
		animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section {

	return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	UITableViewCell *cell =
		[[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

	User *user = [self.users objectAtIndex:indexPath.row];

	dispatch_queue_t queue = dispatch_get_global_queue(
		DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

	dispatch_async(queue, ^{
		NSString *portraitURL = [LRPortraitUtil getPortraitURL:
			[SettingsUtil getSession] male:YES portraitId:user.portraitId
			uuid:user.uuid];

		NSData *data = [NSData dataWithContentsOfURL:
			[NSURL URLWithString:portraitURL]];

		dispatch_async(dispatch_get_main_queue(), ^{
			[cell.imageView setImage:[UIImage imageWithData:data]];
		});
	});

	[cell.imageView setImage:[UIImage imageNamed:@"portrait"]];
	[cell.textLabel setText:user.fullName];

	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	User *user = [self.users objectAtIndex:indexPath.row];

	if (!user.portalUser) {
		return;
	}

	GetDetailsCallback *callback = [[GetDetailsCallback alloc] init:self
		user:user];

	LRBatchSession *batch = [SettingsUtil getBatchSession:callback];

	NSError *error;

	LRContactService_v62 *contactService = [[LRContactService_v62 alloc]
		initWithSession:batch];

	LRPhoneService_v62 *phoneService = [[LRPhoneService_v62 alloc]
		initWithSession:batch];

	[contactService getContactWithContactId:user.contactId error:&error];

	[phoneService getPhonesWithClassName:@"com.liferay.portal.model.Contact"
		classPK:user.contactId error:&error];

	[batch invoke:&error];
}

@end