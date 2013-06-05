//
//  UserThreadService.m
//  Liferay Social
//
//	Bruno Farache
//

#import "AsyncRequest.h"
#import "UserThreadService.h"
#import "GetUserThreadsDelegate.h"
#import "HttpClient.h"

static NSString *_serviceName = @"private-messaging-portlet/userthread";

@implementation UserThreadService

+ (void)getUserThreads:(MessagesTableViewController *)viewController
		loadingView:(UIView *)loadingView {

	NSString *key = [self getCommand:@"get-user-user-threads"];

	NSDictionary *value = @{
		@"deleted": @(NO)
	};

	NSDictionary *command = @{key: value};

	AsyncRequest *request = [HttpClient getAsyncRequest:command];

	id delegate = [[GetUserThreadsDelegate alloc] init:viewController];

	[request setDelegate:delegate loadingView:loadingView];

	[request start];
}

+ (NSString *)getCommand:(NSString *)methodName {
	return [self getCommand:_serviceName methodName:methodName];
}

@end