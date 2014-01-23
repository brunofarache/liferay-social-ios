//
// AppDelegate.m
// Liferay Social
//
// Bruno Farache
//

#import "LiferaySocialAppDelegate.h"

@implementation LiferaySocialAppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window =
		[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	self.tabBarController = [[UITabBarController alloc] init];

	UIViewController *contactsViewController =
		[[ContactsTableViewController alloc] init];

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