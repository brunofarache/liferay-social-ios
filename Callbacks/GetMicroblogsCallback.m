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

#import "GetMicroblogsCallback.h"

/**
 * @author Silvio Santos
 */
@implementation GetMicroblogsCallback

- (id)init:(MicroblogsTableViewController *)viewController
		loadingView:(UIView *)loadingView {

	self = [super init];

	if (self) {
		self.viewController = viewController;
		self.loadingView = loadingView;
	}

	return self;
}

- (void)onFailure:(NSError *)error {
	[self.loadingView hideLoadingHUD];

	[BaseService showErrorMessage:error view:self.loadingView];
}

- (void)onSuccess:(id)result {
	[self.loadingView hideLoadingHUD];

	NSArray *jsonArray = result;

	self.viewController.entries = [self toArray:jsonArray];

	[self.viewController.tableView reloadData];
}

- (NSMutableArray *)toArray:(NSArray *)jsonArray {
	NSMutableArray *entries = [NSMutableArray array];

	for (NSDictionary *jsonObj in jsonArray) {
		MicroblogsEntry *entry = [[MicroblogsEntry alloc] initWithJSON:jsonObj];

		[entries addObject:entry];
	}

	return entries;
}

@end