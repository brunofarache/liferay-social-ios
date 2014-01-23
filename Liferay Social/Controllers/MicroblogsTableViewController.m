//
//	MicroblogsTableViewController.m
//	Liferay Social
//
//	Bruno Farache
//

#import "MicroblogsTableViewController.h"
#import "MicroblogsService.h"

@implementation MicroblogsTableViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];

	if (self) {
		self.title = @"Microblogs";
		self.tabBarItem.image = [UIImage imageNamed:@"first"];
	}

	return self;
}

- (void)viewDidLoad {
	[MicroblogsService getMicroblogsEntries:self
		loadingView:self.navigationController.view];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell =
		[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		cell =
			[[UITableViewCell alloc]
				initWithStyle:UITableViewCellStyleSubtitle
				reuseIdentifier:CellIdentifier];
	}

	MicroblogsEntryModel *entry = [self.entries objectAtIndex:indexPath.row];

	[cell.textLabel setFont:[UIFont boldSystemFontOfSize:TITLE_FONT_SIZE]];
	[cell.textLabel setText:entry.userName];

	[cell.detailTextLabel setFont:[UIFont systemFontOfSize:DETAIL_FONT_SIZE]];
	[cell.detailTextLabel setText:entry.content];
	[cell.detailTextLabel setNumberOfLines:0];

	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section {

	return [self.entries count];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView
		heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	MicroblogsEntryModel *entry = [self.entries objectAtIndex:indexPath.row];

	NSString *username = [entry userName];
	NSString *content = [entry content];

	CGSize screenSize = [[UIScreen mainScreen] bounds].size;

	UIFont *titleFont = [UIFont boldSystemFontOfSize:TITLE_FONT_SIZE];
	UIFont *detailFont = [UIFont systemFontOfSize:DETAIL_FONT_SIZE];

	NSDictionary *titleAtributtes =
		[NSDictionary dictionaryWithObject:titleFont
		forKey: NSFontAttributeName];

	CGSize titleSize =
		[username boundingRectWithSize:screenSize
		options:NSStringDrawingUsesLineFragmentOrigin
		attributes:titleAtributtes context:nil].size;

	NSDictionary *detailAtributtes =
		[NSDictionary dictionaryWithObject:detailFont
		forKey: NSFontAttributeName];

	CGSize detailSize =
		[content boundingRectWithSize:screenSize
		options:NSStringDrawingUsesLineFragmentOrigin
		attributes:detailAtributtes context:nil].size;

	return (titleSize.height + detailSize.height + CELL_PADDING);
}

@end