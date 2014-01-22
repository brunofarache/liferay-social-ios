//
//	ContactsTableViewController.m
//	Liferay Social
//
//	Bruno Farache
//

#import "ContactDetailsTableViewController.h"
#import "ContactsTableViewController.h"
#import "ContactsService.h"
#import "UserModel.h"
#import "PhoneService.h"

@implementation ContactsTableViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];

	if (self) {
		self.title = @"Contacts";
		self.tabBarItem.image = [UIImage imageNamed:@"first"];

		[ContactsService getGroupUsers:self
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

	UserModel *user = [self.entries objectAtIndex:indexPath.row];

	cell.textLabel.text = user.firstName;

	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	UserModel *user = [self.entries objectAtIndex:indexPath.row];

	NSArray *phones = [PhoneService getPhones:user.contactId];

	if ([phones count]) {
		user.phone = phones[0];
	}

	ContactDetailsTableViewController *details =
		[[ContactDetailsTableViewController alloc] init:user];

	[self.navigationController pushViewController:details animated:YES];
}

@end