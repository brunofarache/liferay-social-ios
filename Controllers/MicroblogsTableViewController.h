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

#import "MicroblogsEntryModel.h"

/**
 * @author Bruno Farache
 */

#define CELL_PADDING	26
#define DETAIL_FONT		[UIFont systemFontOfSize:12]
#define TITLE_FONT		[UIFont boldSystemFontOfSize:14]

@interface MicroblogsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *entries;

@end