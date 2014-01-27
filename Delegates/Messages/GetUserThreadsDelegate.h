//
// GetUserThreadsDelegate.h
// Liferay Social
//
// Bruno Farache
//

#import "MessagesTableViewController.h"

@interface GetUserThreadsDelegate : NSObject

- (id)init:(MessagesTableViewController *)viewController;

@property (nonatomic, strong) MessagesTableViewController *viewController;

@end