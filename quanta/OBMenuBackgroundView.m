//
//  OBMenuBackgroundView.m
//  quanta
//
//  Created by Taylor Petrick on 2012-10-28.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBMenuBackgroundView.h"
#import "OBMenuBubble.h"

@implementation OBMenuBackgroundView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initView];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self initView];
    }
    
    return self;
}

-(void)initView
{
    displayLink = [[CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)] retain];
    bubbles     = [[NSMutableArray alloc] initWithCapacity:10];
    
    int max = arc4random()%8;
    for (int i =0; i<max; i++)
    {
        [self addRandomBubble];
    }
}

-(void)addRandomBubble
{
    float red   = (arc4random() % 10) / 100.0f;
    float green = (arc4random() % 80) / 100.0f;
    float blue  = (arc4random() % 40 + 60) / 100.0f;
    
    OBMenuBubble* b = [[OBMenuBubble alloc] init];
    
    b.mRed = red;
    b.mGreen = green;
    b.mBlue = blue;
    b.mAlpha = 0;
    
    float width     = arc4random() % 40 + 40;
    
    float x         = arc4random() % 320;
    float y         = arc4random() % 480;
    
    b.mFrame        = CGRectMake(x, y, width, width);
    
    [bubbles addObject:b];
}

- (void)drawRect:(CGRect)rect
{
    if (!animationRunning)
    {
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        animationRunning = YES;
        
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    int delete[15] = {0};
    
    for (int i = 0; i<bubbles.count; i++)
    {
        OBMenuBubble* bubble = [bubbles objectAtIndex:i];
        [bubble tick];
        if (bubble.mDelete)
        {
            delete[i] = 1;
        }
        else
        {
            [bubble drawInContext:context];
        }
    }
    
    for (int i = 0 ; i<15; i++)
    {
        if (delete[i] == 1 && [bubbles count] > i)
        {
            [bubbles removeObjectAtIndex:i];
        }
    }
    
    if (bubbles.count < 15)
    {
        int chance = arc4random()%100;
        
        if (chance > 90)
        {
            [self addRandomBubble];
        }
    }
}
@end
