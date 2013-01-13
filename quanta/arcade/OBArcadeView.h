//
//  OBArcadeView.h
//  quanta
//
//  Created by Taylor Petrick on 2012-11-04.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "OBGrid.h"

@interface OBArcadeView : UIView
{
    CADisplayLink*  mDisplayLink;
    BOOL            mAnimationRunning;
    
    CGPoint         mFingerPoint;
    BOOL            mDrawFinger;
}

-(void)initArcadeView;

@end
