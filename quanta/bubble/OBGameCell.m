//
// File:    Quanta/Bubble/OBGameCell.m
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//


#import "OBGameCell.h"

@implementation OBGameCell

@synthesize mSelected, mHitCount;

-(id)init
{
    self = [super init];
    if(self)
    {
        mSelected = NO;
        mHitCount = 0;
    }
    
    return self;
}

-(void)drawInContext:(CGContextRef)context
{
    [super drawInContext:context];
    
    if (mSelected)
    {
        CGFloat color[4] = {0.8f, 0.8f, 0.8f, 0.4f};
        CGContextSetFillColor(context, color);
        CGContextFillRect(context, self.mFrame);
    }
}

- (bool)collisionTest:(CGPoint)point
{
    return [super collisionTest:point];
}

@end
