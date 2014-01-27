//
// MicroblogsService.h
// Liferay Social
//
// Bruno Farache
//

#import "BaseService.h"
#import "GetMicroblogsCallback.h"
#import "LRMicroblogsentryService_v62.h"
#import "MicroblogsTableViewController.h"
#import "PrefsUtil.h"
#import "UIView+Loading.h"

@interface MicroblogsService : BaseService

+ (void)getMicroblogsEntries:(MicroblogsTableViewController *)viewController
	loadingView:(UIView *)loadingView;

@end