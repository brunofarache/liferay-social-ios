//
// AsyncRequest.h
// Liferay Social
//
// Josiane Ferreira
// Bruno Farache
//

#import "AFHTTPRequestOperation.h"
#import "ProgressDelegate.h"
#import "PrefsUtil.h"
#import "UIView+Loading.h"

typedef enum {
	AddEntryRequest,
	DeleteEntryRequest,
	DownloadRequest,
	UpdateEntryRequest
} RequestType;

@protocol AsyncRequestDelegate <NSObject>

- (void)requestFailed:(NSError *)error type:(int)type;
- (void)requestFinished:(NSString *)response type:(int)type;

@end

@interface AsyncRequest : AFHTTPRequestOperation

@property (nonatomic, strong) id<AsyncRequestDelegate> delegate;
@property (nonatomic, strong) ProgressDelegate *progressDelegate;
@property (nonatomic) int tag;

- (id)initWithRequest:(NSURLRequest *)request download:(BOOL)download;

- (void)setDelegate:(id<AsyncRequestDelegate>)delegate
	loadingView:(UIView *)loadingView;

@end