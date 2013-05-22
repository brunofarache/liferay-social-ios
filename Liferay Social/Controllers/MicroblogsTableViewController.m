//
//	MicroblogsTableViewController.m
//	Liferay Social
//
//	Bruno Farache
//

#import "MicroblogsEntryModel.h"
#import "MicroblogsTableViewController.h"
#import "MicroblogsService.h"

@implementation MicroblogsTableViewController

- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];

    if (self) {
		self.title = @"Microblogs";
		self.tabBarItem.image = [UIImage imageNamed:@"first"];

		[MicroblogsService getMicroblogsEntries:self
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

	MicroblogsEntryModel *entry = [self.entries objectAtIndex:indexPath.row];

	cell.textLabel.text = entry.content;

    return cell;
}

@end