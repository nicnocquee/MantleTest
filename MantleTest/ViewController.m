//
//  ViewController.m
//  MantleTest
//
//  Created by Nico Prananta on 10/20/13.
//  Copyright (c) 2013 Nico Prananta. All rights reserved.
//

#import "ViewController.h"

#import "Album.h"
#import "Photo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // clear the persistent store
    [NSPersistentStoreCoordinator clearPersistentStore];
	
    NSError *error;
    
    // JSON serialization
    Album *album = [MTLJSONAdapter modelOfClass:[Album class] fromJSONDictionary:[self sampleDictionary] error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error);
    }
    
    // Managed object serialization
    NSManagedObject *albumManagedObject = [MTLManagedObjectAdapter managedObjectFromModel:album insertingIntoContext:[NSManagedObjectContext mainContext] error:&error];
    [[NSManagedObjectContext mainContext] save];
    NSLog(@"Album managed object = %@", albumManagedObject);
    
    // Check number of albums in core data
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"NPRAlbum"];
    NSUInteger count = [[NSManagedObjectContext mainContext] countForFetchRequest:request error:&error];
    
    NSAssert(count == 2, @"Expected 2 albums. Actual = %d", count);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *)sampleDictionary {
    return @{@"albumId": @"1",
             @"name":@"Album name",
             @"cover": @{@"photoId": @"photo1",
                         @"url": @"http://www.google.com",
                         @"albums":@[@"1", @"2"]
                             }
             };
}

@end
