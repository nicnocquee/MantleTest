//
//  Photo.h
//  MantleTest
//
//  Created by Nico Prananta on 10/20/13.
//  Copyright (c) 2013 Nico Prananta. All rights reserved.
//

#import "MTLModel.h"

@interface Photo : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *photoId;
@property (nonatomic, copy, readonly) NSURL *url;
@property (nonatomic, copy, readonly) NSArray *albums;


@end
