//
//  UserThreadModel.m
//  Liferay Social
//
//	Bruno Farache
//

#import "UserThreadModel.h"

@implementation UserThreadModel

- (id)initWithJSON:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.companyId = [[jsonObj objectForKey:@"companyId"] longValue];

		self.createDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"createDate"]];

		self.deleted = [[jsonObj objectForKey:@"deleted"] boolValue];
		self.mbThreadId = [[jsonObj objectForKey:@"mbThreadId"] longValue];

		self.modifiedDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"modifiedDate"]];

		NSDictionary *topMBMessageJson = [jsonObj objectForKey:@"topMBMessage"];

		self.topMBMessage =
			[[MBMessageModel alloc] initWithJSON:topMBMessageJson];

		self.topMBMessageId =
			[[jsonObj objectForKey:@"topMBMessageId"] longValue];

		self.read = [[jsonObj objectForKey:@"read"] boolValue];
		self.userId = [[jsonObj objectForKey:@"userId"] longValue];
		self.userName = [jsonObj objectForKey:@"userName"];
		self.userThreadId = [[jsonObj objectForKey:@"userThreadId"] longValue];
	}

	return self;
}

- (NSDate *)convertNumberToDate:(NSNumber *)number {
	NSString *modifiedDate = [number stringValue];

	modifiedDate = [modifiedDate substringToIndex:(modifiedDate.length - 3)];

	return [NSDate dateWithTimeIntervalSince1970:[modifiedDate longLongValue]];
}

@end