//
// HttpClient.m
// Liferay Social
//
// Josiane Ferreira
// Bruno Farache
//

#import "HttpClient.h"

static HttpClient *_client = nil;
static NSString *_path = @"/api/jsonws/invoke";

@implementation HttpClient

#pragma mark - Life Cycle

- (id)initWithBaseURL:(NSURL *)URL {
	self = [super initWithBaseURL:URL];

	if (self) {
		[[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
	}

	return self;
}

#pragma mark - Private Methods

+ (AsyncRequest *)_getAsyncRequest:(id)parameters {
	HttpClient *client = [self getClient:AFJSONParameterEncoding];

	NSString *method = [self getMethod:YES];

	NSURLRequest *request =
		[client requestWithMethod:method path:_path parameters:parameters];

	return [[AsyncRequest alloc] initWithRequest:request];
}

+ (id)_sendSyncRequest:(id)parameters {
	HttpClient *client = [self getClient:AFJSONParameterEncoding];

	NSString *method = [self getMethod:YES];

	NSURLRequest *request =
		[client requestWithMethod:method path:_path parameters:parameters];

	NSURLResponse *response;
	NSError *error;

	NSData *data =
		[NSURLConnection sendSynchronousRequest:request
			returningResponse:&response error:&error];

	NSString *json =
		[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

	if (error) {
		return nil;
	}

	return [[[SBJsonParser alloc] init] objectWithString:json];
}

+ (HttpClient *)getClient {
	return [self getClient:AFFormURLParameterEncoding];
}

+ (HttpClient *)getClient:(int)parameterEncoding {
	static dispatch_once_t predicate;

	NSURL *baseURL = [NSURL URLWithString:[PrefsUtil getServer]];

	dispatch_once(&predicate, ^{
		_client = [[self alloc] initWithBaseURL:baseURL];
	});

	NSHTTPCookieStorage *cookieStorage =
		[NSHTTPCookieStorage sharedHTTPCookieStorage];

	[cookieStorage setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyNever];

	[_client setBaseURL:baseURL];
	[_client setParameterEncoding:parameterEncoding];

	NSString *email = [PrefsUtil getEmail];
	NSString *password = [PrefsUtil getPassword];

	[_client clearAuthorizationHeader];
	[_client setAuthorizationHeaderWithUsername:email password:password];

	return _client;
}

+ (NSString *)getMethod:(BOOL)post {
	return post ? @"POST" : @"GET";
}

#pragma mark - Static Methods

+ (AsyncRequest *)getAsyncRequest:(NSDictionary *)command {
	return [self _getAsyncRequest:command];
}

+ (AsyncRequest *)getBatchAsyncRequest:(NSArray *)commands {
	return [self _getAsyncRequest:commands];
}

+ (AsyncRequest *)getDownloadAsyncRequest:(NSString *)URL
		filePath:(NSString *)filePath {

	HttpClient *client = [self getClient];

	NSString *method = [self getMethod:NO];

	NSURLRequest *request =
		[client requestWithMethod:method path:URL parameters:nil];

	AsyncRequest *asyncRequest =
		[[AsyncRequest alloc] initWithRequest:request download:YES];

	asyncRequest.outputStream =
		[NSOutputStream outputStreamToFileAtPath:filePath append:NO];

	return asyncRequest;
}

+ (AsyncRequest *)getUploadAsyncRequest:(NSString *)URL data:(NSData *)data
		parameters:(NSDictionary *)parameters {

	HttpClient *client = [self getClient];

	void (^body)(id<AFMultipartFormData>) =
		^(id<AFMultipartFormData> form) {
			NSString *title = [parameters objectForKey:@"title"];
			NSString *mimeType = [parameters objectForKey:@"mimeType"];

			[form appendPartWithFileData:data name:@"file" fileName:title
				mimeType:mimeType];
		};

	NSURLRequest *request =
		[client multipartFormRequestWithMethod:@"POST" path:URL
			parameters:parameters constructingBodyWithBlock:body];

	return [[AsyncRequest alloc] initWithRequest:request];
}

+ (NSURLRequest *)getSyncRequest:(NSDictionary *)command {
	HttpClient *client = [self getClient:AFJSONParameterEncoding];

	NSString *method = [self getMethod:YES];

	return [client requestWithMethod:method path:_path parameters:command];
}

+ (id)sendSyncRequest:(NSDictionary *)command {
	return [self _sendSyncRequest:command];
}

@end