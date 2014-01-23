//
// MicroblogsTableViewController.m
// Liferay Social
//
// Bruno Farache
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

#pragma mark - Private Methods

- (CGFloat)getCellHeight:(NSString *)username content:(NSString *)content {
	NSDictionary *titleAtributtes = @{ NSFontAttributeName: TITLE_FONT };

	CGSize titleSize = [self getTextSize:username attributes:titleAtributtes];

	NSDictionary *detailAtributtes = @{ NSFontAttributeName: DETAIL_FONT };

	CGSize detailSize = [self getTextSize:content attributes:detailAtributtes];

	return (titleSize.height + detailSize.height + CELL_PADDING);
}

- (CGSize)getTextSize:(NSString *)text attributes:(NSDictionary *)attributes {
	CGSize screenSize = [[UIScreen mainScreen] bounds].size;

	CGSize size;

	if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
		size = [text boundingRectWithSize:screenSize
			options:NSStringDrawingUsesLineFragmentOrigin
			attributes:attributes context:nil].size;
	}
	else {
		UIFont *font = [attributes objectForKey:NSFontAttributeName];

		size = [text sizeWithFont:font constrainedToSize:screenSize lineBreakMode:NSLineBreakByWordWrapping];
	}

	return size;
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

	[cell.textLabel setFont:TITLE_FONT];
	[cell.textLabel setText:entry.userName];

	[cell.detailTextLabel setFont:DETAIL_FONT];
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

	return [self getCellHeight:username content:content];
}

@end