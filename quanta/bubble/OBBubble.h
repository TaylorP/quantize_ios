//
// File:    Quanta/Bubble/OBBubble.h
// Author:  Taylor Petrick
// Date:    October 27th, 2012
//

#import "OBElement.h"

///The base class for rendered bubbles
@interface OBBubble : OBElement
{
}

///The red component of the bubble
@property(nonatomic) float mRed;

///The green component of the bubble
@property(nonatomic) float mGreen;

///The blue component of the bubble
@property(nonatomic) float mBlue;

///The alpha component of the bubble
@property(nonatomic) float mAlpha;


///Draws the bubble in a given context
- (void)drawInContext:(CGContextRef)context;

@end
