//
// File:    Quanta/Bubble/OBGameBubble.m
// Author:  Taylor Petrick
// Date:    October 27th, 2012
//

#import "OBGameBubble.h"

@implementation OBGameBubble

-(id)init
{
    self = [super init];
    
    return self;
}

-(id)initWithRed:(CGFloat)pRed andGreen:(CGFloat)pGreen andBlue:(CGFloat)pBlue
{
    self = [super init];
    
    if(self)
    {
        self.mRed = pRed;
        self.mGreen = pGreen;
        self.mBlue = pBlue;
        self.mAlpha = 0.85f;
    }
    
    return self;
}

- (void)drawInContext: (CGContextRef)context
{
    [super drawInContext:context];
    
    /*int textX = self.mFrame.origin.x + self.mFrame.size.width/2.0f - 3;
    int textY = self.mFrame.origin.y + self.mFrame.size.height/2.0f - 10;
    
    NSString* str = [NSString stringWithFormat:@"%i",7];
    [str drawAtPoint:CGPointMake(textX, textY)
            withFont:[UIFont systemFontOfSize:19]];*/
}

@end
