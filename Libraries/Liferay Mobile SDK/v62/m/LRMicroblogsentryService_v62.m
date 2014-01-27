/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
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

#import "LRMicroblogsentryService_v62.h"

/**
 * author Bruno Farache
 */
@implementation LRMicroblogsentryService_v62

- (NSDictionary *)addMicroblogsEntryWithUserId:(long long)userId content:(NSString *)content type:(int)type receiverUserId:(long long)receiverUserId receiverMicroblogsEntryId:(long long)receiverMicroblogsEntryId socialRelationType:(int)socialRelationType serviceContext:(NSDictionary *)serviceContext error:(NSError **)error {
	NSDictionary *_params = @{
		@"userId": @(userId),
		@"content": content,
		@"type": @(type),
		@"receiverUserId": @(receiverUserId),
		@"receiverMicroblogsEntryId": @(receiverMicroblogsEntryId),
		@"socialRelationType": @(socialRelationType),
		@"serviceContext": serviceContext
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/add-microblogs-entry": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSDictionary *)deleteMicroblogsEntryWithMicroblogsEntryId:(long long)microblogsEntryId error:(NSError **)error {
	NSDictionary *_params = @{
		@"microblogsEntryId": @(microblogsEntryId)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/delete-microblogs-entry": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSArray *)getMicroblogsEntriesWithStart:(int)start end:(int)end error:(NSError **)error {
	NSDictionary *_params = @{
		@"start": @(start),
		@"end": @(end)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-microblogs-entries": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

- (NSArray *)getMicroblogsEntriesWithAssetTagName:(NSString *)assetTagName start:(int)start end:(int)end error:(NSError **)error {
	NSDictionary *_params = @{
		@"assetTagName": assetTagName,
		@"start": @(start),
		@"end": @(end)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-microblogs-entries": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

- (NSNumber *)getMicroblogsEntriesCount:(NSError **)error {
	NSDictionary *_params = @{
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-microblogs-entries-count": _params};

	return (NSNumber *)[self.session invoke:_command error:error];
}

- (NSNumber *)getMicroblogsEntriesCountWithAssetTagName:(NSString *)assetTagName error:(NSError **)error {
	NSDictionary *_params = @{
		@"assetTagName": assetTagName
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-microblogs-entries-count": _params};

	return (NSNumber *)[self.session invoke:_command error:error];
}

- (NSDictionary *)getMicroblogsEntryWithMicroblogsEntryId:(long long)microblogsEntryId error:(NSError **)error {
	NSDictionary *_params = @{
		@"microblogsEntryId": @(microblogsEntryId)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-microblogs-entry": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSArray *)getUserMicroblogsEntriesWithMicroblogsEntryUserId:(long long)microblogsEntryUserId start:(int)start end:(int)end error:(NSError **)error {
	NSDictionary *_params = @{
		@"microblogsEntryUserId": @(microblogsEntryUserId),
		@"start": @(start),
		@"end": @(end)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-user-microblogs-entries": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

- (NSArray *)getUserMicroblogsEntriesWithMicroblogsEntryUserId:(long long)microblogsEntryUserId type:(int)type start:(int)start end:(int)end error:(NSError **)error {
	NSDictionary *_params = @{
		@"microblogsEntryUserId": @(microblogsEntryUserId),
		@"type": @(type),
		@"start": @(start),
		@"end": @(end)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-user-microblogs-entries": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

- (NSNumber *)getUserMicroblogsEntriesCountWithMicroblogsEntryUserId:(long long)microblogsEntryUserId error:(NSError **)error {
	NSDictionary *_params = @{
		@"microblogsEntryUserId": @(microblogsEntryUserId)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-user-microblogs-entries-count": _params};

	return (NSNumber *)[self.session invoke:_command error:error];
}

- (NSNumber *)getUserMicroblogsEntriesCountWithMicroblogsEntryUserId:(long long)microblogsEntryUserId type:(int)type error:(NSError **)error {
	NSDictionary *_params = @{
		@"microblogsEntryUserId": @(microblogsEntryUserId),
		@"type": @(type)
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/get-user-microblogs-entries-count": _params};

	return (NSNumber *)[self.session invoke:_command error:error];
}

- (NSDictionary *)updateMicroblogsEntryWithMicroblogsEntryId:(long long)microblogsEntryId content:(NSString *)content socialRelationType:(int)socialRelationType serviceContext:(NSDictionary *)serviceContext error:(NSError **)error {
	NSDictionary *_params = @{
		@"microblogsEntryId": @(microblogsEntryId),
		@"content": content,
		@"socialRelationType": @(socialRelationType),
		@"serviceContext": serviceContext
	};

	NSDictionary *_command = @{@"/microblogs-portlet/microblogsentry/update-microblogs-entry": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

@end