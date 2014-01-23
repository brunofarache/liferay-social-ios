//
// MicroblogsCallback.m
// Liferay Social
//
// Silvio Santos
//

#import "GetMicroblogsCallback.h"

@implementation GetMicroblogsCallback

- (id)init:(MicroblogsTableViewController *)viewController
		loadingView:(UIView *)loadingView {

	self = [super init];

	if (self) {
		self.viewController = viewController;
		self.loadingView = loadingView;
	}

	return self;
}

- (void)onFailure:(NSError *)error {
	[self.loadingView hideLoadingHUD];

	[BaseService showErrorMessage:error view:self.loadingView];
}

- (void)onSuccess:(id)result {
	[self.loadingView hideLoadingHUD];

	NSArray *jsonArray = result;

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