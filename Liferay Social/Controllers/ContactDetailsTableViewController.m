//
//	ContactsDetailsTableViewController.m
//	Liferay Social
//
//	Bruno Farache
//

#import "ContactDetailsTableViewController.h"

@implementation ContactDetailsTableViewController

- (id)init:(UserModel *)user {
    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self) {
		self.user = user;
	}

    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section {

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
				initWithStyle:UITableViewCellStyleDefault
				reuseIdentifier:CellIdentifier];
    }

	if (indexPath.section == 0) {
		cell.textLabel.text = self.user.phone.number;
	}
	else if (indexPath.section == 1) {
		cell.textLabel.text = self.user.emailAddress;
	}

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *action;

	if (indexPath.section == 0) {
		action = [NSString stringWithFormat:@"tel:%@", self.user.phone.number];
	}
	else if (indexPath.section == 1) {
		action =
			[NSString stringWithFormat:@"mailto:%@", self.user.emailAddress];
	}

	NSURL *URL = [NSURL URLWithString:action];

	[[UIApplication sharedApplication] openURL:URL];
}


@end