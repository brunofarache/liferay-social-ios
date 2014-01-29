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

#import "DateUtil.h"
#import "Phone.h"

/**
 * @author Bruno Farache
 */
@interface User : NSObject

@property (nonatomic) BOOL block;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic) BOOL connected;
@property (nonatomic) BOOL connectionRequested;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic) long long entryId;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic) BOOL following;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *jobTitle;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic) BOOL portalUser;
@property (nonatomic) long long userId;

- (id)initWithJSON:(NSDictionary *)jsonObj;

@end