//
// ContactsService.m
// Liferay Social
//
// Bruno Farache
//

#import "ContactsService.h"

static NSString *_serviceName = @"user";

@implementation ContactsService

+ (void)getGroupUsers:(ContactsTableViewController *)viewController
		loadingView:(UIView *)loadingView {

	NSString *key = [self getCommand:@"get-group-users"];

	NSDictionary *value = @{
		@"groupId": [PrefsUtil getGroupId]
	};

	NSDictionary *command = @{key: value};

	AsyncRequest *request = [HttpClient getAsyncRequest:command];

	id delegate = [[GetGroupUsersDelegate alloc] init:viewController];

	[request setDelegate:delegate loadingView:loadingView];

	[request start];
}

+ (NSString *)getCommand:(NSString *)methodName {
	return [self getCommand:_serviceName methodName:methodName];
}

@end