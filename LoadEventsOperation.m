//
//  LoadEventsOperation.m
//  #RDGGEEK
//
//  Created by Chris Bewick on 22/07/2010.
//  Copyright 2010 Stompfrog. All rights reserved.
//


#import "LoadEventsOperation.h"
#import "CJSONDeserializer.h"
#import "NSOperation+ActivityIndicator.h"

@implementation LoadEventsOperation

@synthesize delegate;

-(void)main{
	NSLog(@"working");
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	[self setNetworkActivityIndicatorVisible:YES];
	
	NSData *json = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://readinggeeknight.com/events.json"]];
	//NSData *json = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://localhost/test.json"]];
	
	
	
	NSArray *eventsArray = [[CJSONDeserializer deserializer] deserializeAsArray:json error:nil];
	[self performSelectorOnMainThread:@selector(publicTimelineDidLoad:) withObject:eventsArray waitUntilDone:YES];
	[self setNetworkActivityIndicatorVisible:NO];
	[json release];
	[pool drain];
}

-(void)publicTimelineDidLoad:(NSArray *)publicTimeline{
	if(![self isCancelled]){
		[[NSUserDefaults standardUserDefaults] setObject:publicTimeline forKey:kJsonData];
		[self.delegate LoadEventsOperation:self publicTimelineDidLoad:publicTimeline];
	}
}

@end
