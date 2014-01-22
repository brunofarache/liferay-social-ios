//
//  AppDelegate.h
//	Liferay Social
//
//	Bruno Farache
//

#import "ContactsTableViewController.h"
#import "MicroblogsTableViewController.h"

@interface LiferaySocialAppDelegate : NSObject <UIApplicationDelegate>

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UIWindow *window;

@end