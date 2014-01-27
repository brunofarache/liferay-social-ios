//
// BaseService.h
// Liferay Social
//
// Bruno Farache
//

#import "HandleException.h"
#import "JSON.h"
#import "PrefsUtil.h"
#import "UIView+Loading.h"

typedef enum {
	CertificateError
} ErrorTag;

@interface BaseService : NSObject

+ (NSString *)getCommand:(NSString *)serviceName
	methodName:(NSString *)methodName;

+ (NSString *)getURL:(NSString *)serviceName methodName:(NSString *)methodName;
+ (id)handleException:(NSString *)response view:(UIView *)view;

+ (BOOL)isCertificateErrorMessage:(NSInteger)code
	alertDelegate:(id)alertDelegate;

+ (BOOL)setTrustCertificate:(NSInteger *)tag
	buttonIndex:(NSInteger)buttonIndex;

+ (void)showErrorMessage:(NSError *)error view:(UIView *)view;
+ (void)showFailMessage:(NSString *)message view:(UIView *)view;

+ (void)showMessage:(NSString *)message view:(UIView *)view
	image:(UIImage *)image;

+ (void)showSuccessMessage:(NSString *)message view:(UIView *)view;

@end