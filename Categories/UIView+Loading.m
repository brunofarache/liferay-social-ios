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

#import "UIView+Loading.h"

/**
 * @author Josiane Bezerra
 */
@implementation UIView (Loading)

static MBProgressHUD *_HUD;

- (void)hideLoadingHUD {
	if (_HUD) {
		[MBProgressHUD hideHUDForView:self animated:YES];
	}
}

- (void)showLoadingHUD {
	if (!_HUD) {
		_HUD = [MBProgressHUD showHUDAddedTo:self animated:YES];

		[_HUD setDelegate:self];

		[_HUD setLabelText:NSLocalizedString(@"loading", nil)];
	}
}

- (void)showMessageHUD:(NSString *)message customView:(UIView *)customView {
	_HUD = [[MBProgressHUD alloc] initWithView:self];

	[_HUD setMinSize:CGSizeMake(100, 100)];
	[_HUD setOpacity:0.65f];
	[_HUD setLabelText:NSLocalizedString(message, nil)];
	[_HUD setCustomView:customView];
	[_HUD setMode:MBProgressHUDModeCustomView];
	[_HUD setDelegate:self];

	[self addSubview:_HUD];

	[_HUD show:YES];

	[_HUD hide:YES afterDelay:1.5];
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
	if ([hud isEqual:_HUD]) {
		_HUD = nil;
	}
}

@end