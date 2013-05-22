//
//  ContactsService.h
//  Liferay Social
//
//	Bruno Farache
//

#import "BaseService.h"
#import "ContactsTableViewController.h"

@interface ContactsService : BaseService

+ (void)getGroupUsers:(ContactsTableViewController *)viewController
	loadingView:(UIView *)loadingView;

@end