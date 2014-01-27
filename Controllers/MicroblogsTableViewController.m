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

#import "MicroblogsTableViewController.h"
#import "MicroblogsService.h"

/**
 * @author Bruno Farache
 */

@implementation MicroblogsTableViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];

	if (self) {
		self.title = @"Microblogs";
		self.tabBarItem.image = [UIImage imageNamed:@"first"];
	}

	return self;
}

- (void)viewDidLoad {
	[MicroblogsService getMicroblogsEntries:self
		loadingView:self.navigationController.view];
}

#pragma mark - Private Methods

- (CGFloat)getCellHeight:(NSString *)username content:(NSString *)content {
	NSDictionary *titleAtributtes = @{ NSFontAttributeName: TITLE_FONT };

	CGSize titleSize = [self getTextSize:username attributes:titleAtributtes];

	NSDictionary *detailAtributtes = @{ NSFontAttributeName: DETAIL_FONT };

	CGSize detailSize = [self getTextSize:content attributes:detailAtributtes];

	return (titleSize.height + detailSize.height + CELL_PADDING);
}

- (CGSize)getTextSize:(NSString *)text attributes:(NSDictionary *)attributes {
	CGSize screenSize = [[UIScreen mainScreen] bounds].size;

	CGSize size;

	if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
		CGRect rect = [text boundingRectWithSize:screenSize
			options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes
			context:nil];

		size = rect.size;
	}
	else {
		UIFont *font = [attributes objectForKey:NSFontAttributeName];

		size = [text sizeWithFont:font constrainedToSize:screenSize
			lineBreakMode:NSLineBreakByWordWrapping];
	}

	return size;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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
				initWithStyle:UITableViewCellStyleSubtitle
				reuseIdentifier:CellIdentifier];
	}

	MicroblogsEntry *entry = [self.entries objectAtIndex:indexPath.row];

	[cell.textLabel setFont:TITLE_FONT];
	[cell.textLabel setText:entry.userName];

	[cell.detailTextLabel setFont:DETAIL_FONT];
	[cell.detailTextLabel setText:entry.content];
	[cell.detailTextLabel setNumberOfLines:0];

	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section {

	return [self.entries count];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView
		heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	MicroblogsEntry *entry = [self.entries objectAtIndex:indexPath.row];

	NSString *username = [entry userName];
	NSString *content = [entry content];

	return [self getCellHeight:username content:content];
}

@end