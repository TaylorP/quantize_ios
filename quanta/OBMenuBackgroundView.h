//
//  OBMenuBackgroundView.h
//  quanta
//
//  Created by Taylor Petrick on 2012-10-28.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface OBMenuBackgroundView : UIView
{
    CADisplayLink*  displayLink;
    BOOL            animationRunning;
    
    NSMutableArray* bubbles;
}
@end
