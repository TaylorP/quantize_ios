//
// File:    Quanta/Bubble/OBGameBubble.h
// Author:  Taylor Petrick
// Date:    October 27th, 2012
//

#import "OBBubble.h"

///A class for bubbles rendered in the game
@interface OBGameBubble : OBBubble
{
}

///An int for bubbles that are order-dependent
@property(nonatomic) int mOrderNumber;

///Whether or not the bubble has been surrounded by lines
@property(nonatomic) bool mSurrounded;


///Inits the bubble with colors
- (id)initWithRed:(CGFloat)pRed andGreen:(CGFloat)pGreen andBlue:(CGFloat)pBlue;

///Override this method since we'll need to render text too
- (void)drawInContext:(CGContextRef)context;

@end
