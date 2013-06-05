//
//	MessagesTableViewController.m
//	Liferay Social
//
//	Bruno Farache
//

#import "MessagesTableViewController.h"
#import "UserThreadService.h"
#import "UserThreadModel.h"

@implementation MessagesTableViewController

- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];

    if (self) {
		self.title = @"Messages";
		self.tabBarItem.image = [UIImage imageNamed:@"first"];

		[UserThreadService getUserThreads:self
			  loadingView:self.navigationController.view];
    }

    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section {

	return [self.entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell =
		[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		cell =
			[[UITableViewCell alloc]
				initWithStyle:UITableViewCellStyleDefault
				reuseIdentifier:CellIdentifier];
    }


	UserThreadModel *entry = [self.entries objectAtIndex:indexPath.row];

	cell.textLabel.text = entry.userName;
	
    return cell;
}

@end