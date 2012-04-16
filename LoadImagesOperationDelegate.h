//
//  LoadImagesOperationDelegate.h
//  DrillDown
//
//  Created by Paul Booth on 22/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LoadImagesOperationDelegate <NSObject>

@required

-(void)imagesOperation:(NSOperation *)theImageOperation didLoadProfileImage:(UIImage *)profileImage andBackgroundImage:(UIImage *)backgroundImage;

@end
