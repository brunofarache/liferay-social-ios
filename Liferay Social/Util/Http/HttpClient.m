//
//  HttpClient.m
//  Liferay Sync
//
//  Josiane Ferreira
//  Bruno Farache
//

#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "HttpClient.h"
#import "PrefsUtil.h"

@implementation HttpClient

#pragma mark - Life Cycle

- (id)initWithBaseURL:(NSURL *)URL {
	self = [super initWithBaseURL:URL];

	if (self) {
		[[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
	}

	return self;
}

#pragma mark - Class Methods

+ (HttpClient *)client {
	static dispatch_once_t predicate;
	static HttpClient *_client = nil;

	dispatch_once(&predicate, ^{
		NSURL *URL = [NSURL URLWithString:[PrefsUtil getServer]];

		_client = [[self alloc] initWithBaseURL:URL];
	});

	return _client;
}

+ (NSString *)getMethod:(BOOL)post {
	return post ? @"POST" : @"GET";
}

+ (void)setupClient {
	HttpClient *client = [self client];

	NSHTTPCookieStorage *cookieStorage =
		[NSHTTPCookieStorage sharedHTTPCookieStorage];

	[cookieStorage setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyNever];

	NSURL *baseURL = [NSURL URLWithString:[PrefsUtil getServer]];

	client.baseURL = baseURL;

	NSString *email = [PrefsUtil getEmail];
	NSString *password = [PrefsUtil getPassword];

	[client clearAuthorizationHeader];
	[client setAuthorizationHeaderWithUsername:email password:password];
}

#pragma mark - Static Methods

+ (AsyncRequest *)getAsyncRequest:(NSString *)URL post:(BOOL)post {
	return [self getAsyncRequest:URL post:post params:nil];
}

+ (AsyncRequest *)getAsyncRequest:(NSString *)URL post:(BOOL)post
		params:(NSDictionary *)params {

	return [self getAsyncRequest:URL post:post params:params download:NO];
}

+ (AsyncRequest *)getAsyncRequest:(NSString *)URL post:(BOOL)post
		params:(NSDictionary *)params download:(BOOL)download {

	[self setupClient];

	HttpClient *client = [self client];

	NSString *method = [self getMethod:post];

	NSURLRequest *request =
		[client requestWithMethod:method path:URL parameters:params];

	return [[AsyncRequest alloc] initWithRequest:request download:download];
}

+ (AsyncRequest *)getDownloadAsyncRequest:(NSString *)URL
		filePath:(NSString *)filePath {

	AsyncRequest *request =
		[self getAsyncRequest:URL post:NO params:nil download:YES];

	request.outputStream =
		[NSOutputStream outputStreamToFileAtPath:filePath append:NO];

	return request;
}

+ (NSURLRequest *)getSyncRequest:(NSString *)URL post:(BOOL)post {
	[self setupClient];

	HttpClient *client = [self client];

	NSString *method = [self getMethod:post];

	return [client requestWithMethod:method path:URL parameters:nil];
}

+ (AsyncRequest *)getUploadAsyncRequest:(NSString *)URL data:(NSData *)data
		params:(NSDictionary *)params {

	[self setupClient];

	HttpClient *client = [self client];

	void (^body)(id<AFMultipartFormData>) =
		^(id<AFMultipartFormData> form) {
			NSString *title = [params objectForKey:@"title"];
			NSString *mimeType = [params objectForKey:@"mimeType"];

			[form appendPartWithFileData:data name:@"file" fileName:title
				mimeType:mimeType];
		};

	NSURLRequest *request =
		[client multipartFormRequestWithMethod:@"POST" path:URL
			parameters:params constructingBodyWithBlock:body];

	return [[AsyncRequest alloc] initWithRequest:request];
}

@end