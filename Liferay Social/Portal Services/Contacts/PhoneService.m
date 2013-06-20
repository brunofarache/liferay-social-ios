//
//  PhoneService.m
//  Liferay Social
//
//	Bruno Farache
//

#import "AsyncRequest.h"
#import "PhoneService.h"
#import "HttpClient.h"

static NSString *_serviceName = @"phone";

@implementation PhoneService

+ (NSArray *)getPhones:(long)contactId {
	NSString *key = [self getCommand:@"get-phones"];

	NSDictionary *value = @{
		@"className": @"com.liferay.portal.model.Contact",
		@"classPk": @(contactId)
	};

	NSDictionary *command = @{key: value};

	NSArray *jsonArray = [HttpClient sendSyncRequest:command];

	NSMutableArray *phones = [NSMutableArray array];

	for (NSDictionary *phone in jsonArray) {
		[phones addObject:[[PhoneModel alloc] initWithJSON:phone]];
	}

	return phones;
}

+ (NSString *)getCommand:(NSString *)methodName {
	return [self getCommand:_serviceName methodName:methodName];
}

@end