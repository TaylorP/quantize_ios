//
// File:    Quanta/Bubble/OBCell.m
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//

#import "OBCell.h"

@implementation OBCell

-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.mType = eElementEmpty;
    }
    
    return self;
}

- (void)drawInContext: (CGContextRef)context
{
}

- (bool)collisionTest:(CGPoint)point
{
    return [super collisionTest:point];
}


@end
