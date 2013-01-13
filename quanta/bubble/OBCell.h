//
// File:    Quanta/Bubble/OBCell.h
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//

#import "OBElement.h"

///A generic base class for cell types
@interface OBCell : OBElement
{
}

///Draws the cell in a given context
- (void)drawInContext:(CGContextRef)context;

@end
