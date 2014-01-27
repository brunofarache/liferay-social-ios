//
// PhoneModel.m
// Liferay Social
//
// Bruno Farache
//

#import "PhoneModel.h"

@implementation PhoneModel

- (id)initWithJSON:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		self.extension = [jsonObj objectForKey:@"extension"];
		self.number = [jsonObj objectForKey:@"number"];
		self.phoneId = [[jsonObj objectForKey:@"phoneId"] longValue];
		self.primary = [[jsonObj objectForKey:@"primary"] boolValue];
	}

	return self;
}

@end