//
//  LoadEventsEventsDelegate.h
//  #RDGGEEK
//
//  Created by Chris Bewick on 22/07/2010.
//  Copyright 2010 Stompfrog. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LoadEventsOperationDelegate

-(void)LoadEventsOperation:(NSOperation *)theOperation publicTimelineDidLoad:(NSArray *)thePublicTimeline;

@end
