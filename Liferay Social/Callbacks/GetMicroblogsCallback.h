//
// MicroblogsCallback.h
// Liferay Social
//
// Silvio Santos
//

#import "BaseService.h"
#import "LRCallback.h"
#import "MicroblogsTableViewController.h"
#import "UIView+Loading.h"

@interface GetMicroblogsCallback : NSObject <LRCallback>

@property (nonatomic, strong) UIView *loadingView;
@property (nonatomic, strong) MicroblogsTableViewController *viewController;

- (id)init:(MicroblogsTableViewController *)viewController
	loadingView:(UIView *)loadingView;

@end