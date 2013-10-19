//
//  Photo.m
//  MantleTest
//
//  Created by Nico Prananta on 10/20/13.
//  Copyright (c) 2013 Nico Prananta. All rights reserved.
//

#import "Photo.h"
#import "Album.h"

@implementation Photo

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)albumsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *albums) {
        NSMutableArray *transformedAlbums = [NSMutableArray arrayWithCapacity:albums.count];
        for (NSString *albumId in albums) {
            Album *transformedAlbum = [[Album alloc] initWithAlbumId:albumId];
            [transformedAlbums addObject:transformedAlbum];
        }
        return transformedAlbums;
    } reverseBlock:^id(NSArray *albums) {
        NSMutableArray *transformedAlbums = [NSMutableArray arrayWithCapacity:albums.count];
        for (Album *album in albums) {
            [transformedAlbums addObject:album.albumId];
        }
        return transformedAlbums;
    }];
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

+ (NSString *)managedObjectEntityName {
    return @"NPRPhoto";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
    return [NSSet setWithObject:@"photoId"];
}

+ (NSValueTransformer *)urlEntityAttributeTransformer {
    return [[self class] urlJSONTransformer];
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{@"albums": [Album class]};
}

@end
