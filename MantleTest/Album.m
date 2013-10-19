//
//  Album.m
//  MantleTest
//
//  Created by Nico Prananta on 10/20/13.
//  Copyright (c) 2013 Nico Prananta. All rights reserved.
//

#import "Album.h"
#import "Photo.h"

@implementation Album

- (id)initWithAlbumId:(NSString *)albumId {
    if (self = [super init]) {
        _albumId = albumId;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

+ (NSValueTransformer *)coverJSONTransformer {
    return [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[Photo class]];
}

+ (NSString *)managedObjectEntityName {
    return @"NPRAlbum";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
    return [NSSet setWithObject:@"albumId"];
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{@"cover": [Photo class]};
}

@end
