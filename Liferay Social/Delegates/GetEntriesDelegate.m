//
//  GetEntriesDelegate.m
//  Liferay Social
//
//	Bruno Farache
//

#import "GetEntriesDelegate.h"
#import "BaseService.h"
#import "JSON.h"
#import "MicroblogsEntryModel.h"

@implementation GetEntriesDelegate

- (id)init:(MicroblogsTableViewController *)viewController {
	self = [super init];

	if (self) {
		self.viewController = viewController;
	}

	return self;
}

- (void)requestFailed:(NSError *)error type:(int)type {
	NSLog(@"%@", error);
}

- (void)requestFinished:(NSString *)response type:(int)type {
	NSArray *jsonArray =
		[BaseService handleException:response
			view:self.viewController.tableView];

	self.viewController.entries = [self toArray:jsonArray];

	[self.viewController.tableView reloadData];
}

- (NSMutableArray *)toArray:(NSArray *)jsonArray {
	NSMutableArray *entries = [NSMutableArray array];

	for (NSDictionary *jsonObj in jsonArray) {
		MicroblogsEntryModel *entry =
			[[MicroblogsEntryModel alloc] initWithJSON:jsonObj];

		[entries addObject:entry];
	}

	return entries;
}

@end