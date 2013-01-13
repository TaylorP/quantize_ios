//
//  OBArcadeView.m
//  quanta
//
//  Created by Taylor Petrick on 2012-11-04.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBArcadeView.h"
#import "OBArcadeState.h"

@implementation OBArcadeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initArcadeView];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self initArcadeView];
    }
    return self;
}

-(void)initArcadeView
{
    mDisplayLink = [[CADisplayLink displayLinkWithTarget:self
                                               selector:@selector(setNeedsDisplay)] retain];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    CGPoint point = [[touches anyObject] locationInView:self];
    
    [[OBArcadeState sharedArcadeState].mGrid startPointing];
    [[OBArcadeState sharedArcadeState].mGrid addPoint:point];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![OBArcadeState sharedArcadeState].mFail)
    {
        CGPoint point = [[touches anyObject] locationInView:self];
    
        [[OBArcadeState sharedArcadeState].mGrid addPoint:point];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![OBArcadeState sharedArcadeState].mFail)
    {
        [[OBArcadeState sharedArcadeState].mGrid donePointing:false];
    }
    
    [OBArcadeState sharedArcadeState].mFail = false;
}

- (void)drawRect:(CGRect)rect
{
    if (!mAnimationRunning)
    {
        [mDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        mAnimationRunning = YES;
        
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[OBArcadeState sharedArcadeState].mGrid drawInContext:context];
}



@end
