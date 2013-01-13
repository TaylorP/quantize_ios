//
//  OBArcadeLevelView.h
//  quanta
//
//  Created by Taylor Petrick on 2012-11-04.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface OBArcadeLevelView : UIView
{
    CADisplayLink*  mDisplayLink;
    BOOL            mAnimationRunning;
}

@end
