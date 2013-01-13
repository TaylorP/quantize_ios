//
//  OBBuilderToolsView.m
//  quanta
//
//  Created by Taylor Petrick on 2013-01-05.
//  Copyright (c) 2013 Orange Bytes. All rights reserved.
//

#import "OBBuilderToolsView.h"

@implementation OBBuilderToolsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initTools];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initTools];
    }
    return self;
}

-(void)initTools
{
    selected = 0;
    elements = (OBElement**)malloc(sizeof(OBElement*) * 3);
    elements[0] = [[OBGameBubble alloc] initWithRed:0.8 andGreen:0.8 andBlue:0.8];
    [elements[0] setMFrame:CGRectMake(4, 5, 32, 32)];
    elements[1] = [[OBTunnel alloc] initWithAlpha:0.75];
    [elements[1] setMFrame:CGRectMake(48, 5, 32, 32)];
    elements[2] = 0;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (int i = 0; i<3; i++)
    {
        if (elements[i])
        {
            [elements[i] drawInContext:context];
        }
    }
}

@end
