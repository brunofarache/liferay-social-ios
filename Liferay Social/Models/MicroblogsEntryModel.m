//
// FileModel.m
// Liferay Social
//
// Bruno Farache
//

#import "MicroblogsEntryModel.h"

@implementation MicroblogsEntryModel

- (id)initWithJSON:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.companyId = [[jsonObj objectForKey:@"companyId"] longValue];
		self.content = [jsonObj objectForKey:@"content"];

		self.createDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"createDate"]];

		self.microblogsEntryId =
			[[jsonObj objectForKey:@"microblogsEntryId"] longValue];

		self.modifiedDate =
			[self convertNumberToDate:[jsonObj objectForKey:@"modifiedDate"]];

		self.receiverMicroblogsEntryId =
			[[jsonObj objectForKey:@"receiverMicroblogsEntryId"] longValue];

		self.receiverUserId =
			[[jsonObj objectForKey:@"receiverUserId"] longValue];

		self.socialRelationType =
			[[jsonObj objectForKey:@"socialRelationType"] intValue];

		self.type = [[jsonObj objectForKey:@"type"] intValue];
		self.userId = [[jsonObj objectForKey:@"userId"] longValue];
		self.userName = [jsonObj objectForKey:@"userName"];
	}

	return self;
}

- (NSDate *)convertNumberToDate:(NSNumber *)number {
	NSString *modifiedDate = [number stringValue];

	modifiedDate = [modifiedDate substringToIndex:(modifiedDate.length - 3)];

	return [NSDate dateWithTimeIntervalSince1970:[modifiedDate longLongValue]];
}

@end