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

#import "DetailsTableViewController.h"
#import "LRContactService_v62.h"
#import "LREntryService_v62.h"
#import "LRPhoneService_v62.h"
#import "LRServiceFactory.h"
#import "PrefsUtil.h"
#import "ProgressView.h"

/**
 * @author Bruno Farache
 */
@interface UsersTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *users;

- (void)showDetails:(User *)user;

@end