//
//  MicroblogsService.h
//  Liferay Social
//
//	Bruno Farache
//

#import "BaseService.h"
#import "MicroblogsTableViewController.h"

@interface MicroblogsService : BaseService

+ (void)getEntries:(MicroblogsTableViewController *)viewController
	   loadingView:(UIView *)loadingView;

@end