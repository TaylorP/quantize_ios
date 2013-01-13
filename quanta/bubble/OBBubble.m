//
// File:    Quanta/Bubble/OBBubble.m
// Author:  Taylor Petrick
// Date:    October 27th, 2012
//

#import "OBBubble.h"

@implementation OBBubble
@synthesize mRed, mGreen, mBlue, mAlpha;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.mType = eElementBubble;
    }
    
    return self;
}

- (void)drawInContext: (CGContextRef)context
{
    CGFloat color[] = {self.mRed, self.mGreen, self.mBlue, self.mAlpha};
    CGContextSetStrokeColor(context, color);
    
    CGContextSetLineWidth(context, 3.0f);
    CGContextStrokeEllipseInRect(context, self.mFrame);
    CGContextStrokePath(context);
    
    color[3] *= 0.5;
    
    CGContextSetFillColor(context, color);
    CGContextFillEllipseInRect(context, self.mFrame);
}

- (bool)collisionTest:(CGPoint)point
{
    CGPoint center = CGPointMake(self.mFrame.origin.x + self.mFrame.size.width/2.0f,
                                 self.mFrame.origin.y + self.mFrame.size.height/2.0f);
    
    float xDist = point.x - center.x;
    float yDist = point.y - center.y;
    
    float dist = sqrt(xDist*xDist + yDist*yDist);
    
    return dist < self.mFrame.size.width/2.0f;
}



@end
