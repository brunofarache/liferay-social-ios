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
#import "ProgressView.h"

/**
 * @author Silvio Santos
 */
@implementation GetMicroblogsCallback

- (id)init:(MicroblogsTableViewController *)controller {
	self = [super init];

	if (self) {
		self.controller = controller;
	}

	return self;
}

- (void)onFailure:(NSError *)error {
	NSLog(@"Error: %@", error);

	[ProgressView hide];
	[self.controller setEntries:[NSMutableArray array]];
}

- (void)onSuccess:(id)result {
	[ProgressView hide];

	NSMutableArray *entries = [NSMutableArray array];

	for (NSDictionary *jsonObj in result) {
		MicroblogsEntry *entry = [[MicroblogsEntry alloc] init:jsonObj];

		[entries addObject:entry];
	}

	[self.controller setEntries:entries];
}

@end