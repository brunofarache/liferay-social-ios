//
//  GetMicroblogsEntriesDelegate.h
//  Liferay Social
//
//	Bruno Farache
//

#import "MicroblogsTableViewController.h"

@interface GetMicroblogsEntriesDelegate : NSObject

- (id)init:(MicroblogsTableViewController *)viewController;

@property (nonatomic, strong) MicroblogsTableViewController *viewController;

@end