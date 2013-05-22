//
//  AppDelegate.h
//	Liferay Social
//
//	Bruno Farache
//

#import <UIKit/UIKit.h>

@interface LiferaySocialAppDelegate : UIResponder
	<UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end