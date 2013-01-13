//
//  OBBuilderSizeView.m
//  quanta
//
//  Created by Taylor Petrick on 2013-01-05.
//  Copyright (c) 2013 Orange Bytes. All rights reserved.
//

#import "OBBuilderSizeView.h"

@implementation OBBuilderSizeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context  = UIGraphicsGetCurrentContext();
    
    CGFloat white[] = {1,1,1,0.7};
    CGContextSetStrokeColor(context, white);
    CGContextSetFillColor(context, white);
    CGContextSetLineWidth(context, 2);
    
    for (int i = 0; i<4; i++)
    {
        CGRect frame = CGRectMake(4 + i*36, 4, 32, 32);
        CGContextStrokeEllipseInRect(context, frame);
        CGContextStrokePath(context);
        
        int textX = frame.origin.x + 10.0f;
        int textY = frame.origin.y + 4.0f;
        
        NSString* str = [NSString stringWithFormat:@"%i",i+3];
        [str drawAtPoint:CGPointMake(textX, textY)
                withFont:[UIFont systemFontOfSize:19]];
    }
}


@end
