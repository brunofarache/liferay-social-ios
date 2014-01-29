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

- (id)init:(MicroblogsTableViewController *)viewController {
	self = [super init];

	if (self) {
		self.viewController = viewController;
	}

	return self;
}

- (void)onFailure:(NSError *)error {
	NSLog(@"Error: %@", error);

	[self.viewController setEntries:[NSMutableArray array]];
}

- (void)onSuccess:(id)result {
	NSMutableArray *entries = [NSMutableArray array];

	for (NSDictionary *jsonObj in result) {
		MicroblogsEntry *entry = [[MicroblogsEntry alloc] initWithJSON:jsonObj];

		[entries addObject:entry];
	}

	[self.viewController setEntries:entries];
}

@end