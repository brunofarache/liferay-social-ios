//
// PrefsUtil.h
// Liferay Social
//
// Bruno Farache
//

#import "LRSession.h"
#import "Validator.h"

@interface PrefsUtil : NSObject

+ (NSString *)encodeURL:(NSString *)string;
+ (NSString *)getEmail;
+ (NSString *)getFolderPath;
+ (NSString *)getGroupFriendlyURL;
+ (NSNumber *)getGroupId;
+ (NSString *)getPassword;
+ (CGRect)getScreenFrame;
+ (CGRect)getScreenFrame:(UIDeviceOrientation)orientation;
+ (NSString *)getServer;
+ (LRSession *)getSession;
+ (BOOL)isTrustCertificate;
+ (BOOL)needsSetup;
+ (BOOL)reloadUserSites;
+ (void)saveEmail:(NSString *)email;
+ (void)savePassword:(NSString *)password;
+ (void)saveServer:(NSString *)server;
+ (void)setTrustCertificate:(BOOL)trustCertificate;
+ (void)updateFolderPath:(long)folderId folderName:(NSString *)folderName;

@end