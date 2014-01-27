/**
 * Copyright (c) 2000-2014 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

#import "AFHTTPClient.h"
#import "AsyncRequest.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "JSON.h"

/**
 * @author Josiane Bezerra
 * @author Bruno Farache
 */

@interface HttpClient : AFHTTPClient

@property (nonatomic, strong) NSURL *baseURL;

+ (AsyncRequest *)getAsyncRequest:(NSDictionary *)command;
+ (AsyncRequest *)getBatchAsyncRequest:(NSArray *)commands;

+ (AsyncRequest *)getDownloadAsyncRequest:(NSString *)URL
	filePath:(NSString *)filePath;

+ (AsyncRequest *)getUploadAsyncRequest:(NSString *)URL data:(NSData *)data
	parameters:(NSDictionary *)parameters;

+ (NSURLRequest *)getSyncRequest:(NSDictionary *)commad;
+ (id)sendSyncRequest:(NSDictionary *)command;

@end