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

/**
 * @author Bruno Farache
 */
@interface MicroblogsEntry : NSObject

@property (nonatomic) long companyId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic) long microblogsEntryId;
@property (nonatomic, strong) NSDate *modifiedDate;
@property (nonatomic) long receiverMicroblogsEntryId;
@property (nonatomic) long receiverUserId;
@property (nonatomic) int socialRelationType;
@property (nonatomic) int type;
@property (nonatomic) long userId;
@property (nonatomic, strong) NSString *userName;

- (id)init:(NSDictionary *)jsonObj;

@end