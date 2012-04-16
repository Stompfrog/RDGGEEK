//
//  LoadEventsOperation.h
//  #RDGGEEK
//
//  Created by Chris Bewick on 22/07/2010.
//  Copyright 2010 Stompfrog. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "LoadEventsOperationDelegate.h"

#define kJsonData @"jsonData"

@interface LoadEventsOperation : NSOperation {
	id <LoadEventsOperationDelegate> delegate;
}

@property (nonatomic, assign) id <LoadEventsOperationDelegate> delegate;

@end
