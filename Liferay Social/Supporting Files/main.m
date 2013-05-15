//
//	main.m
//	Liferay Social
//
//	Bruno Farache
//

#import <UIKit/UIKit.h>

#import "LiferaySocialAppDelegate.h"

int main(int argc, char *argv[]) {

	@autoreleasepool {
		NSString *className = NSStringFromClass(
			[LiferaySocialAppDelegate class]);
		
	    return UIApplicationMain(argc, argv, nil, className);
	}

}