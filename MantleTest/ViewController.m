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
	
    NSError *error;
    Album *album = [MTLJSONAdapter modelOfClass:[Album class] fromJSONDictionary:[self sampleDictionary] error:&error];
    
    NSAssert(album!=nil, @"Album should not be nil");
    
    [self.textView setText:album.description];
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
                         @"url": @"http://someurl.com",
                         @"albums":@[@"1", @"2"]
                             }
             };
}

@end
