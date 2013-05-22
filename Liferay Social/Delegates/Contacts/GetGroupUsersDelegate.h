//
//  GetGroupUsersDelegate.h
//  Liferay Social
//
//	Bruno Farache
//

#import "ContactsTableViewController.h"

@interface GetGroupUsersDelegate : NSObject

- (id)init:(ContactsTableViewController *)viewController;

@property (nonatomic, strong) ContactsTableViewController *viewController;

@end