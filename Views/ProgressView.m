/**
 * Copyright (c) 2000-2014 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

#import "ProgressView.h"

/**
 * @author Bruno Farache
 */
@implementation ProgressView

+ (void)hide:(UIViewController *)controller {
	UIView *parent = controller.navigationController.view;
	UIView *view = [parent viewWithTag:PROGRESS_TAG];

	[parent setUserInteractionEnabled:YES];
	[view removeFromSuperview];
}

+ (void)show:(UIViewController *)controller {
	UIView *parent = controller.navigationController.view;
	UIView *progress = [self createProgress:parent];

	[parent setUserInteractionEnabled:NO];
	[parent addSubview:progress];
}

#pragma mark - Private Methods

+ (UIView *)createProgress:(UIView *)parent {
	UIView *progress = [[UIView alloc] initWithFrame:
		CGRectMake(0, 0, PROGRESS_HEIGHT, PROGRESS_WIDTH)];

	[progress setCenter:parent.center];
	[progress setTag:PROGRESS_TAG];

	CALayer *layer = progress.layer;

	[layer setBackgroundColor:[PROGRESS_COLOR CGColor]];
	[layer setCornerRadius:PROGRESS_RADIUS];

	[layer setShadowOffset:CGSizeMake(1, 0)];
	[layer setShadowColor:[PROGRESS_SHADOW_COLOR CGColor]];
	[layer setShadowOpacity:PROGRESS_SHADOW_OPACITY];
	[layer setShadowRadius:PROGRESS_RADIUS];

	[progress addSubview:[self createIndicator:progress]];

	return progress;
}

+ (UIActivityIndicatorView *)createIndicator:(UIView *)parent {
	UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]
		initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];

	CGRect frame = CGRectMake(
		parent.frame.size.width/2, parent.frame.size.height/2, 0, 0);

	[indicator setFrame:frame];
	[indicator startAnimating];

	return indicator;
}

@end