//
//  ContactsService.h
//  Liferay Social
//
//	Bruno Farache
//

#import "ContactsTableViewController.h"
#import "GetGroupUsersDelegate.h"
#import "HttpClient.h"
#import "PrefsUtil.h"

@interface ContactsService : BaseService

+ (void)getGroupUsers:(ContactsTableViewController *)viewController
	loadingView:(UIView *)loadingView;

@end