//
//	MicroblogsTableViewController.m
//	Liferay Social
//
//	Bruno Farache
//

#import "MicroblogsTableViewController.h"

@implementation MicroblogsTableViewController

- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];

    if (self) {
		self.title = NSLocalizedString(@"First", @"First");
		self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }

    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section {

	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell =
		[tableView dequeueReusableCellWithIdentifier:CellIdentifier
			forIndexPath:indexPath];

    return cell;
}

@end