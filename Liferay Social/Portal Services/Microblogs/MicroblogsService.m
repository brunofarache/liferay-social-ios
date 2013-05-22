//
//  MicroblogsService.m
//  Liferay Social
//
//	Bruno Farache
//

#import "AsyncRequest.h"
#import "MicroblogsService.h"
#import "GetEntriesDelegate.h"
#import "HttpClient.h"

static NSString *_serviceName = @"microblogs-portlet/microblogsentry";

@implementation MicroblogsService

+ (void)getEntries:(MicroblogsTableViewController *)viewController
		loadingView:(UIView *)loadingView {

	NSString *key = [self getCommand:@"get-microblogs-entries"];

	NSDictionary *value = @{
		@"start": @(-1),
		@"end":  @(-1)
	};

	NSDictionary *command = @{key: value};

	AsyncRequest *request = [HttpClient getAsyncRequest:command];

	id delegate = [[GetEntriesDelegate alloc] init:viewController];

	[request setDelegate:delegate loadingView:loadingView];

	[request start];
}

+ (NSString *)getCommand:(NSString *)methodName {
	return [self getCommand:_serviceName methodName:methodName];
}

@end