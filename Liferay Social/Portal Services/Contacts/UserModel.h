//
//  UserModel.h
//  Liferay Social
//
//	Bruno Farache
//

@interface UserModel : NSObject


@property (nonatomic) long companyId;
@property (nonatomic) long contactId;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic) long facebookId;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *greeting;
@property (nonatomic, strong) NSString *jobTitle;
@property (nonatomic, strong) NSString *languageId;
@property (nonatomic, strong) NSDate *lastLoginDate;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic) long portraitId;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *timeZoneId;
@property (nonatomic) long userId;
@property (nonatomic, strong) NSString *uuid;

- (id)initWithJSON:(NSDictionary *)jsonObj;

@end