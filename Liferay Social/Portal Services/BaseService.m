//
//  BaseService.m
//  Liferay Social
//
//	Bruno Farache
//

#import "BaseService.h"
#import "HandleException.h"
#import "JSON.h"
#import "PrefsUtil.h"
#import "UIView+Loading.h"

#define INVALID_CERTIFICATE_CODE -1202

@implementation BaseService

+ (NSString *)getCommand:(NSString *)serviceName
		methodName:(NSString *)methodName {

	return [NSString stringWithFormat:@"/%@/%@", serviceName, methodName];
}

+ (NSString *)getURL:(NSString *)serviceName methodName:(NSString *)methodName {
	NSString *URL =
		[NSString stringWithFormat:@"api/jsonws/%@/%@", serviceName,
			methodName];

	return URL;
}

+ (id)handleException:(NSString *)response view:(UIView *)view {
	SBJsonParser *parser = [[SBJsonParser alloc] init];

	id jsonObj = [parser objectWithString:response];

	if ([jsonObj isKindOfClass:[NSDictionary class]]) {
		NSString *exception = [jsonObj objectForKey:@"exception"];

		if (exception) {
			NSString *exceptionMessage =
				[HandleException stringForException:exception];

			jsonObj = nil;

			if (view) {
				[self showFailMessage:exceptionMessage view:view];
			}
		}
	}

	return jsonObj;
}

+ (BOOL)isCertificateErrorMessage:(NSInteger)code
		alertDelegate:(id)alertDelegate {

	if (code == INVALID_CERTIFICATE_CODE) {
		NSString *message = NSLocalizedString(
			@"the-certificate-could-not-be-verified", nil);

		UIAlertView *alertView =
			[[UIAlertView alloc] initWithTitle:@""
				message:message delegate:alertDelegate
				cancelButtonTitle:NSLocalizedString(@"cancel", nil)
				otherButtonTitles:NSLocalizedString(@"always-trust", nil), nil];

		alertView.tag = CertificateError;

		[alertView show];

		return YES;
	}

	return NO;
}

+ (BOOL)setTrustCertificate:(NSInteger *)tag buttonIndex:(NSInteger)index {
	if ((tag == CertificateError) && (index == 1)) {
		[PrefsUtil setTrustCertificate:YES];

		return YES;
	}

	return NO;
}

+ (void)showErrorMessage:(NSError *)error view:(UIView *)view {
	NSString *message = [error localizedDescription];
	NSInteger code = [error code];

	switch (code) {
		case NSURLErrorUserCancelledAuthentication:
			message = NSLocalizedString(@"wrong-credentials", nil);

			break;

		case NSURLErrorCancelled:
			message = NSLocalizedString(@"download-cancelled", nil);

			break;
	}

	[self showFailMessage:message view:view];
}

+ (void)showFailMessage:(NSString *)message view:(UIView *)view {
	UIImage *image = [UIImage imageNamed:@"close.png"];

	[self showMessage:message view:view image:image];
}

+ (void)showMessage:(NSString *)message view:(UIView *)view
		image:(UIImage *)image {

	UIView *customView = [[UIImageView alloc] initWithImage:image];

	[view showMessageHUD:message customView:customView];
}

+ (void)showSuccessMessage:(NSString *)message view:(UIView *)view {
	UIImage *image = [UIImage imageNamed:@"checkmark.png"];

	[self showMessage:message view:view image:image];
}

@end