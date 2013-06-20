//
//  HttpClient.h
//  Liferay Social
//
//  Josiane Ferreira
//  Bruno Farache
//

#import "AFHTTPClient.h"
#import "AsyncRequest.h"

@interface HttpClient : AFHTTPClient

+ (AsyncRequest *)getDownloadAsyncRequest:(NSString *)URL
	filePath:(NSString *)filePath;

+ (AsyncRequest *)getAsyncRequest:(NSDictionary *)command;
+ (AsyncRequest *)getBatchAsyncRequest:(NSArray *)commands;

+ (AsyncRequest *)getUploadAsyncRequest:(NSString *)URL data:(NSData *)data
	parameters:(NSDictionary *)parameters;

+ (NSURLRequest *)getSyncRequest:(NSDictionary *)commad;

+ (id)sendSyncRequest:(NSDictionary *)command;

@property (readwrite, nonatomic, retain) NSURL *baseURL;

@end