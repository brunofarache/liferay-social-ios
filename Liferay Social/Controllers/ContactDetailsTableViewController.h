//
// ContactsDetailsTableViewController.h
// Liferay Social
//
// Bruno Farache
//

#import "UserModel.h"

@interface ContactDetailsTableViewController : UITableViewController

@property (nonatomic, strong) UserModel *user;

- (id)init:(UserModel *)user;

@end