//
//	MicroblogsTableViewController.h
//	Liferay Social
//
//	Bruno Farache
//

#import "MicroblogsEntryModel.h"

#define CELL_PADDING 26
#define DETAIL_FONT [UIFont systemFontOfSize:12]
#define TITLE_FONT [UIFont boldSystemFontOfSize:14]

@interface MicroblogsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *entries;

@end