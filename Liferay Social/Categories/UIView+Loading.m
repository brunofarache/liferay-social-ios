//
// UIView+Loading.m
// Liferay Social
//
// Josiane Ferreira
//

#import "UIView+Loading.h"

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