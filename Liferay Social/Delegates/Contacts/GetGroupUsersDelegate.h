//
// GetGroupUsersDelegate.h
// Liferay Social
//
// Bruno Farache
//

#import "ContactsTableViewController.h"

@interface GetGroupUsersDelegate : NSObject

@property (nonatomic, strong) ContactsTableViewController *viewController;

- (id)init:(ContactsTableViewController *)viewController;

@end