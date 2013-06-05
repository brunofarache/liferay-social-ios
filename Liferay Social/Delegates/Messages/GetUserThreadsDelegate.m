//
//  GetUserThreadsDelegate.m
//  Liferay Social
//
//	Bruno Farache
//

#import "GetUserThreadsDelegate.h"
#import "BaseService.h"
#import "JSON.h"
#import "UserThreadModel.h"

@implementation GetUserThreadsDelegate

- (id)init:(MessagesTableViewController *)viewController {
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
		UserThreadModel *entry =
			[[UserThreadModel alloc] initWithJSON:jsonObj];

		[entries addObject:entry];
	}

	return entries;
}

@end