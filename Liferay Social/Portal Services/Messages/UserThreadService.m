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

	NSString *key =
		@"$threads = /private-messaging-portlet/userthread/get-user-user-threads";

	NSDictionary *value = @{
		@"deleted": @(NO),
		@"$topMBMessage = /private-messaging-portlet/userthread/get-last-thread-message": @{
			@"@mbThreadId": @"$threads.mbThreadId"
		}
	};

	NSDictionary *command = @{key : value};

	AsyncRequest *request = [HttpClient getAsyncRequest:command];

	id delegate = [[GetUserThreadsDelegate alloc] init:viewController];

	[request setDelegate:delegate loadingView:loadingView];

	[request start];
}

+ (NSString *)getCommand:(NSString *)methodName {
	return [self getCommand:_serviceName methodName:methodName];
}

@end