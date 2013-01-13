//
// File:    Quanta/Bubble/OBElement.h
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//

#import <UIKit/UIKit.h>

///Enumeration of element types
typedef enum OBBubbleElementType
{
    eElementEmpty   = 0,
    eElementBubble  = 1,
    eElementPath    = 2,
    eElementTunnel  = 3
} OBBubbleElementType;

///A basic renderable element
@interface OBElement : NSObject
{
}

///The frame describing the bubble's location
@property(nonatomic) CGRect mFrame;

@property(nonatomic) OBBubbleElementType mType;

///Draws the element in a given context
- (void)drawInContext:(CGContextRef)context;

///Checks if a point is in the element
- (bool)collisionTest:(CGPoint)point;

@end
