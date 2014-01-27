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

#import "MicroblogsService.h"

/**
 * @author Bruno Farache
 */

static NSString *_serviceName = @"microblogs-portlet/microblogsentry";

@implementation MicroblogsService

+ (void)getMicroblogsEntries:(MicroblogsTableViewController *)viewController
		loadingView:(UIView *)loadingView {

	LRMicroblogsentryService_v62 *service =
		[[LRMicroblogsentryService_v62 alloc] init];

	GetMicroblogsCallback *callback =
		[[GetMicroblogsCallback alloc]
			init:viewController loadingView:loadingView];

	LRSession *session = [PrefsUtil getSession];

	[session setCallback:callback];

	[service setSession:session];

	[loadingView showLoadingHUD];

	NSError *error;

	[service getMicroblogsEntriesWithStart:-1 end:-1 error:&error];
}

@end