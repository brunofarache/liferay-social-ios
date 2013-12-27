//
//	AppDelegate.m
//	Liferay Social
//
//	Bruno Farache
//

#import "ContactsTableViewController.h"
#import "LiferaySocialAppDelegate.h"
#import "MicroblogsTableViewController.h"

@implementation LiferaySocialAppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window =
		[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	self.tabBarController = [[UITabBarController alloc] init];

	UIViewController *contactsViewController =
		[self getNavigationController:[[ContactsTableViewController alloc] init]];

	UIViewController *microblogsViewController =
		[[MicroblogsTableViewController alloc] init];

	self.tabBarController.viewControllers =
		@[contactsViewController, microblogsViewController];

	self.window.rootViewController = self.tabBarController;

	[self.window makeKeyAndVisible];

	return YES;
}

- (UINavigationController *)getNavigationController:(UIViewController *)root {
	UINavigationController *navigationController =
		[[UINavigationController alloc] initWithRootViewController:root];

	[navigationController.navigationBar setBarStyle:UIBarStyleBlack];

	return navigationController;
}

@end