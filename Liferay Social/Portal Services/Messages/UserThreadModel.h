//
//  UserThreadModel.h
//  Liferay Social
//
//	Bruno Farache
//

#import "MBMessageModel.h"

@interface UserThreadModel : NSObject

@property (nonatomic) long companyId;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic) BOOL deleted;
@property (nonatomic) long mbThreadId;
@property (nonatomic, strong) NSDate *modifiedDate;
@property (nonatomic, strong) MBMessageModel *topMBMessage;
@property (nonatomic) long topMBMessageId;
@property (nonatomic) BOOL read;
@property (nonatomic) long userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic) long userThreadId;

- (id)initWithJSON:(NSDictionary *)jsonObj;

@end