//
// MicroblogsService.m
// Liferay Social
//
// Bruno Farache
//

#import "MicroblogsService.h"

static NSString *_serviceName = @"microblogs-portlet/microblogsentry";

@implementation MicroblogsService

+ (void)getMicroblogsEntries:(MicroblogsTableViewController *)viewController
		loadingView:(UIView *)loadingView {

	LRMicroblogsentryService_v62 *service =
		[[LRMicroblogsentryService_v62 alloc] init];

	GetMicroblogsCallback *callback =
		[[GetMicroblogsCallback alloc]
			init:viewController loadingView:loadingView];

	LRSession *session = [PrefsUtil getSession];
	[session setCallback:callback];

	[service setSession:session];

	[loadingView showLoadingHUD];

	NSError *error;

	[service getMicroblogsEntriesWithStart:-1 end:-1 error:&error];
}

@end