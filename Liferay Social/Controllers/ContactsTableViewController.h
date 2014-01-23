//
// ContactsTableViewController.h
// Liferay Social
//
// Bruno Farache
//

#import "ContactDetailsTableViewController.h"
#import "UserModel.h"
#import "PhoneService.h"

@interface ContactsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *entries;

@end