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

#import "AFHTTPRequestOperation.h"
#import "ProgressDelegate.h"
#import "PrefsUtil.h"
#import "UIView+Loading.h"

/**
 * @author Josiane Bezerra
 * @author Bruno Farache
 */

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

- (void)setDelegate:(id<AsyncRequestDelegate>)delegate
	loadingView:(UIView *)loadingView;

@end