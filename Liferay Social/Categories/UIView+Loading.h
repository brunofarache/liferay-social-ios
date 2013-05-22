//
//  UIView+Loading.h
//  Liferay Social
//
//  Josiane Ferreira
//

#import "MBProgressHUD.h"

@interface UIView (Loading) <MBProgressHUDDelegate>

- (void)hideLoadingHUD;
- (void)showLoadingHUD;
- (void)showMessageHUD:(NSString *)message customView:(UIView *)view;

@end