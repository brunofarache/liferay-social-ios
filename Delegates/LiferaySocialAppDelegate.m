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

#import "MicroblogsTableViewController.h"
#import "SignInViewController.h"
#import "UsersTableViewController.h"

/**
 * @author Bruno Farache
 */
@implementation LiferaySocialAppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window =
		[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	[self.window setRootViewController:[[SignInViewController alloc] init]];
	[self.window makeKeyAndVisible];

	return YES;
}

- (void)setTabBarController {
	self.tabBarController = [[UITabBarController alloc] init];

	UIViewController *contactsViewController =
		[[UsersTableViewController alloc] init];

	UINavigationController *contactsNavigationController =
		[self _getNavigationController:contactsViewController];

	UIViewController *microblogsViewController =
		[[MicroblogsTableViewController alloc] init];

	UINavigationController *microblogsNavigationController =
		[self _getNavigationController:microblogsViewController];

	[self.tabBarController setViewControllers:
		@[contactsNavigationController, microblogsNavigationController]];

	[self.window setRootViewController:self.tabBarController];
}

#pragma mark - Private Methods

- (UINavigationController *)_getNavigationController:(UIViewController *)root {
	UINavigationController *navigationController =
		[[UINavigationController alloc] initWithRootViewController:root];

	[navigationController.navigationBar setBarStyle:UIBarStyleBlack];

	return navigationController;
}

@end