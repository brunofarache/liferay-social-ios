//
//  MBMessageModel.m
//  Liferay Social
//
//	Bruno Farache
//

#import "MBMessageModel.h"

@implementation MBMessageModel

- (id)initWithJSON:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.body = [jsonObj objectForKey:@"body"];
	}

	return self;
}

- (NSDate *)convertNumberToDate:(NSNumber *)number {
	NSString *modifiedDate = [number stringValue];

	modifiedDate = [modifiedDate substringToIndex:(modifiedDate.length - 3)];

	return [NSDate dateWithTimeIntervalSince1970:[modifiedDate longLongValue]];
}

@end