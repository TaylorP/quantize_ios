//
//  OBArcadeLevelView.m
//  quanta
//
//  Created by Taylor Petrick on 2012-11-04.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBArcadeLevelView.h"
#import "OBArcadeColors.h"
#import "OBArcadeState.h"

@implementation OBArcadeLevelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
        mDisplayLink = [[CADisplayLink displayLinkWithTarget:self
                                                    selector:@selector(setNeedsDisplay)] retain];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        mDisplayLink = [[CADisplayLink displayLinkWithTarget:self
                                                    selector:@selector(setNeedsDisplay)] retain];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (!mAnimationRunning)
    {
        [mDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        mAnimationRunning = YES;
        
        return;
    }
    
    int currentLevel = [OBArcadeState sharedArcadeState].mLevelNumber;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);

    CGContextSetStrokeColor(context, [OBArcadeColors strokeColorForLevel:-1]);
    
    for(int i = currentLevel; i<kMaxLevel; i++)
    {
        CGRect frame = CGRectMake(40*i + 2, 1, 30, 30);
        CGContextStrokeEllipseInRect(context, frame);
        CGContextStrokePath(context);
        
        CGContextSetFillColor(context, [OBArcadeColors fillColorForLevel:-1]);
        CGContextFillEllipseInRect(context, frame);
    }
    
    for (int i = 0; i<currentLevel; i++)
    {
        CGRect frame = CGRectMake(40*i + 2, 1, 30, 30);
        CGContextSetStrokeColor(context, [OBArcadeColors strokeColorForLevel:i]);
        CGContextStrokeEllipseInRect(context, frame);
        CGContextStrokePath(context);
    
        CGContextSetFillColor(context, [OBArcadeColors fillColorForLevel:i]);
        CGContextFillEllipseInRect(context, frame);
        
        int textX = frame.origin.x + 10.0f;
        int textY = frame.origin.y + 4.0f;
        
        NSString* str = [NSString stringWithFormat:@"%i",i+1];
        [str drawAtPoint:CGPointMake(textX, textY)
                   withFont:[UIFont systemFontOfSize:19]];
    }
}

@end
