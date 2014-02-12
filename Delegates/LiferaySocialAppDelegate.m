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

#import "LiferaySocialAppDelegate.h"

/**
 * @author Bruno Farache
 */
@implementation LiferaySocialAppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window =
		[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	self.tabBarController = [[UITabBarController alloc] init];

	UIViewController *contactsViewController =
		[[UsersTableViewController alloc] init];

	UINavigationController *contactsNavigationController =
		[self getNavigationController:contactsViewController];

	UIViewController *microblogsViewController =
		[[MicroblogsTableViewController alloc] init];

	UINavigationController *microblogsNavigationController =
		[self getNavigationController:microblogsViewController];

	self.tabBarController.viewControllers =
		@[contactsNavigationController, microblogsNavigationController];

	self.window.rootViewController = self.tabBarController;

	[self.window makeKeyAndVisible];

	return YES;
}

#pragma mark - Private Methods

- (UINavigationController *)getNavigationController:(UIViewController *)root {
	UINavigationController *navigationController =
		[[UINavigationController alloc] initWithRootViewController:root];

	[navigationController.navigationBar setBarStyle:UIBarStyleBlack];

	return navigationController;
}

@end