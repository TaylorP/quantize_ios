//
// File:    Quanta/Bubble/OBElement.m
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//

#import "OBElement.h"

@implementation OBElement

@synthesize mFrame;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.mType = eElementEmpty;
    }
    
    return self;
}

- (void)drawInContext:(CGContextRef)context
{
    
}

- (bool)collisionTest:(CGPoint)point
{
    return CGRectContainsPoint(mFrame, point);
}

@end
