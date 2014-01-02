//
//	MicroblogsTableViewController.h
//	Liferay Social
//
//	Bruno Farache
//

#import <UIKit/UIKit.h>

#define CELL_PADDING 26
#define DETAIL_FONT_SIZE 12
#define TITLE_FONT_SIZE 14

@interface MicroblogsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *entries;

@end