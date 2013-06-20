//
//  PhoneModel.h
//  Liferay Social
//
//	Bruno Farache
//

@interface PhoneModel : NSObject

@property (nonatomic, strong) NSString *extension;
@property (nonatomic, strong) NSString *number;
@property (nonatomic) long phoneId;
@property (nonatomic) BOOL primary;

- (id)initWithJSON:(NSDictionary *)jsonObj;

@end