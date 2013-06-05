//
//  MBMessageModel.h
//  Liferay Social
//
//	Bruno Farache
//

@interface MBMessageModel : NSObject

@property (nonatomic, strong) NSString *body;

- (id)initWithJSON:(NSDictionary *)jsonObj;

@end