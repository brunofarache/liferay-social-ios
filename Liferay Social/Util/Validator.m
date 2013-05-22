//
//  Validator.m
//  Liferay Social
//
//	Bruno Farache
//

#import "Validator.h"

@implementation Validator

+ (BOOL)isNull:(NSString *)string {
	if ((string == nil) || [string isKindOfClass:[NSNull class]]) {
		return YES;
	}

	NSCharacterSet *whitespace = [NSCharacterSet whitespaceCharacterSet];

	string = [string stringByTrimmingCharactersInSet:whitespace];

	if (string.length == 0) {
		return YES;
	}

	return NO;
}

@end