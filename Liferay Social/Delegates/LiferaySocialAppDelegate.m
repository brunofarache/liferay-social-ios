//
//	AppDelegate.m
//	Liferay Social
//
//	Bruno Farache
//

#import "LiferaySocialAppDelegate.h"

#import "MicroblogsTableViewController.h"

@implementation LiferaySocialAppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window =
		[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	self.tabBarController = [[UITabBarController alloc] init];

	UIViewController *microblogsViewController =
		[[MicroblogsTableViewController alloc] init];

	self.tabBarController.viewControllers = @[microblogsViewController];

	self.window.rootViewController = self.tabBarController;

    [self.window makeKeyAndVisible];

	return YES;
}

@end