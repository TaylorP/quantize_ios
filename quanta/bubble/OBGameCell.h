//
// File:    Quanta/Bubble/OBGameCell.h
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//

#import "OBCell.h"

/// A plain game cell without any special atributes
@interface OBGameCell : OBCell
{
}

/// Whether or not the game cell has been activated with a path
@property (nonatomic) bool mSelected;

/// Te number of times this cell has been selected;
@property (nonatomic) int mHitCount;

/// Override this here to render the select/unselected state
- (void)drawInContext:(CGContextRef)context;

@end
