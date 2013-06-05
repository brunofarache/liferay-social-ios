//
//	AppDelegate.m
//	Liferay Social
//
//	Bruno Farache
//

#import "ContactsTableViewController.h"
#import "LiferaySocialAppDelegate.h"
#import "MessagesTableViewController.h"
#import "MicroblogsTableViewController.h"

@implementation LiferaySocialAppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window =
		[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	self.tabBarController = [[UITabBarController alloc] init];

	UIViewController *contactsViewController =
		[[ContactsTableViewController alloc] init];

	UIViewController *messagesViewController =
		[[MessagesTableViewController alloc] init];

	UIViewController *microblogsViewController =
		[[MicroblogsTableViewController alloc] init];

	self.tabBarController.viewControllers =
  		@[contactsViewController, messagesViewController,
	  		microblogsViewController];

	self.window.rootViewController = self.tabBarController;

    [self.window makeKeyAndVisible];

	return YES;
}

@end