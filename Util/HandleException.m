//
// HandleException.m
// Liferay Social
//
// Josiane Ferreira
//

#import "HandleException.h"

@implementation HandleException

+ (NSString *)stringForException:(NSString *)error {
	NSArray *errorParts = [error componentsSeparatedByString:@":"];

	NSString *lastErrorPart = @"";

	if ([errorParts count] > 1) {
		lastErrorPart = [errorParts lastObject];
	}

	NSString *firstErrorPart = [errorParts objectAtIndex:0];

	NSArray *exceptionParts = [firstErrorPart componentsSeparatedByString:@"."];

	error = [exceptionParts lastObject];

	NSRegularExpression *regex =
		[NSRegularExpression regularExpressionWithPattern:@"\\B[A-Z]"
			options:NSRegularExpressionSearch error:nil];

	NSArray *matches = [regex matchesInString:error options:0
		range:NSMakeRange(0, [error length])];

	NSMutableString *mutableException =
		[NSMutableString stringWithString:error];

	for (int i = 0; i < [matches count]; i++) {
		NSRange matchRange = [[matches objectAtIndex:i] range];

		[mutableException insertString:@" " atIndex:(matchRange.location + i)];
	}

	if ([lastErrorPart length]) {
		error = [NSString stringWithFormat:@"%@:%@", mutableException,
			lastErrorPart];

		return error;
	}

	return mutableException;
}

@end