//
//  Album.h
//  MantleTest
//
//  Created by Nico Prananta on 10/20/13.
//  Copyright (c) 2013 Nico Prananta. All rights reserved.
//

#import "MTLModel.h"

@class Photo;

@interface Album : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic, copy, readonly) NSString *albumId;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) Photo *cover;

- (id)initWithAlbumId:(NSString *)albumId;

@end
