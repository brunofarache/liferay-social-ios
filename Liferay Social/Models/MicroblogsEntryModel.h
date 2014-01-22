//
//  FileModel.h
//  Liferay Social
//
//	Bruno Farache
//

@interface MicroblogsEntryModel : NSObject

@property (nonatomic) long companyId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic) long microblogsEntryId;
@property (nonatomic, strong) NSDate *modifiedDate;
@property (nonatomic) long receiverMicroblogsEntryId;
@property (nonatomic) long receiverUserId;
@property (nonatomic) int socialRelationType;
@property (nonatomic) int type;
@property (nonatomic) long userId;
@property (nonatomic, strong) NSString *userName;

- (id)initWithJSON:(NSDictionary *)jsonObj;

@end