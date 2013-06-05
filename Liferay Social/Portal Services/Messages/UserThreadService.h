//
//  UserThreadService.h
//  Liferay Social
//
//	Bruno Farache
//

#import "BaseService.h"
#import "MessagesTableViewController.h"

@interface UserThreadService : BaseService

+ (void)getUserThreads:(MessagesTableViewController *)viewController
	loadingView:(UIView *)loadingView;

@end