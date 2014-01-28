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

@property (nonatomic) long companyId;
@property (nonatomic) long contactId;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic) long facebookId;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *greeting;
@property (nonatomic, strong) NSString *jobTitle;
@property (nonatomic, strong) NSString *languageId;
@property (nonatomic, strong) NSDate *lastLoginDate;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic, strong) Phone *phone;
@property (nonatomic) long portraitId;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *timeZoneId;
@property (nonatomic) long userId;
@property (nonatomic, strong) NSString *uuid;

- (id)initWithJSON:(NSDictionary *)jsonObj;

@end