//
//  LoadImagesOperation.m
//  DrillDown
//
//  Created by Paul Booth on 22/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LoadImagesOperation.h"
#import "NSOperation+ActivityIndicator.h"


@implementation LoadImagesOperation

@interface LoadImagesOperation(Private)
-(UIImage *)loadImageForKeyPath:(NSString *)keypath;
@end

@synthesize delegate;
@synthesize tweet;

-(void)main
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
	[self setNetworkActivityIndicatorVisible:YES];
    
	// Load the images.
    UIImage *profileImage = [self loadImageForKeyPath:@"user.profile_image_url"];
    
    UIImage *backgroundImage = [self loadImageForKeyPath:@"user.profile_background_image_url"];
    
    // TODO: Call the delegate method to return the images
    NSArray *images = [[NSArray alloc] initWithObjects:profileImage,backgroundImage,nil];
    [self performSelectorOnMainThread:@selector(imagesLoaded:) withObject:images waitUntilDone:YES];
     
    [self.tweet release];
	
	[self setNetworkActivityIndicatorVisible:NO];

    [pool drain];
}

#pragma mark -
#pragma mark Private Methods

-(UIImage *)loadImageForKeyPath:(NSString *)keypath
{
    UIImage *theImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.tweet valueForKeyPath:keypath]]]];
    return theImage;
}

#pragma mark -
#pragma mark Main Thread

-(void)imagesLoaded:(NSArray *)images
{
    // Only make the delegate call if we haven't been cancelled
    if (![self isCancelled])
    {
        // Make delegate call to pass images back to view
        [delegate imagesOperation:self didLoadProfileImage:[images objectAtIndex:0] andBackgroundImage:[images objectAtIndex:1]];
    }
}

@end
