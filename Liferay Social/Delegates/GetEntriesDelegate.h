//
//  GetEntriesDelegate.h
//  Liferay Social
//
//	Bruno Farache
//

#import "MicroblogsTableViewController.h"

@interface GetEntriesDelegate : NSObject

- (id)init:(MicroblogsTableViewController *)viewController;

@property (nonatomic, strong) MicroblogsTableViewController *viewController;

@end