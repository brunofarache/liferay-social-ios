//
//  HttpClient.h
//  Liferay Sync
//
//  Josiane Ferreira
//  Bruno Farache
//

#import "AFHTTPClient.h"
#import "AsyncRequest.h"

@interface HttpClient : AFHTTPClient

+ (AsyncRequest *)getAsyncRequest:(NSString *)URL post:(BOOL)post;

+ (AsyncRequest *)getAsyncRequest:(NSString *)URL post:(BOOL)post
	params:(NSDictionary *)params;

+ (AsyncRequest *)getDownloadAsyncRequest:(NSString *)URL
	filePath:(NSString *)filePath;

+ (NSURLRequest *)getSyncRequest:(NSString *)URL post:(BOOL)post;

+ (AsyncRequest *)getUploadAsyncRequest:(NSString *)URL data:(NSData *)data
	params:(NSDictionary *)params;

@property (readwrite, nonatomic, retain) NSURL *baseURL;

@end