//
//  LoadImagesOperation.h
//  DrillDown
//
//  Created by Paul Booth on 22/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadImagesOperationDelegate.h"

@interface LoadImagesOperation : NSOperation 
{
    id <LoadImagesOperationDelegate> delegate;
    NSDictionary *tweet;
}

@property (nonatomic, assign) id <LoadImagesOperationDelegate> delegate;
@property (nonatomic, retain) NSDictionary *tweet;

@end
