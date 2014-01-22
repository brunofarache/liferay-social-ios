//
//  HttpClient.h
//  Liferay Social
//
//  Josiane Ferreira
//  Bruno Farache
//

#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "AsyncRequest.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "JSON.h"
#import "PrefsUtil.h"

@interface HttpClient : AFHTTPClient

@property (readwrite, nonatomic, retain) NSURL *baseURL;

+ (AsyncRequest *)getAsyncRequest:(NSDictionary *)command;
+ (AsyncRequest *)getBatchAsyncRequest:(NSArray *)commands;

+ (AsyncRequest *)getDownloadAsyncRequest:(NSString *)URL
	filePath:(NSString *)filePath;

+ (AsyncRequest *)getUploadAsyncRequest:(NSString *)URL data:(NSData *)data
	parameters:(NSDictionary *)parameters;

+ (NSURLRequest *)getSyncRequest:(NSDictionary *)commad;
+ (id)sendSyncRequest:(NSDictionary *)command;

@end