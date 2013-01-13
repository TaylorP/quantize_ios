//
//  OBTunnel.m
//  quanta
//
//  Created by Taylor Petrick on 2012-12-21.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBTunnel.h"

@implementation OBTunnel

-(id)initWithAlpha:(float)alpha
{
    self = [super init];
    
    if (self)
    {
        mAlpha = alpha;
        self.mType = eElementTunnel;
    }
    
    return self;
}

-(void)drawInContext:(CGContextRef)context
{
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, 3);
    
    CGFloat white[] = {1,1,1,mAlpha};
    
    CGContextSetStrokeColor(context, white);
    
    CGContextMoveToPoint(context, self.mFrame.origin.x+2.0f, self.mFrame.origin.y + self.mFrame.size.height/3.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+2.0f, self.mFrame.origin.y+2.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+self.mFrame.size.width/3.0f, self.mFrame.origin.y+2.0f);
    CGContextStrokePath(context);

    CGContextMoveToPoint(context, self.mFrame.origin.x+self.mFrame.size.width-2.0f, self.mFrame.origin.y + self.mFrame.size.height/3.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+self.mFrame.size.width-2.0f, self.mFrame.origin.y+2.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+self.mFrame.size.width*2.0f/3.0f, self.mFrame.origin.y+2.0f);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, self.mFrame.origin.x+2.0f, self.mFrame.origin.y + self.mFrame.size.height*2.0f/3.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+2.0f, self.mFrame.origin.y+self.mFrame.size.height-2.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+self.mFrame.size.width/3.0f, self.mFrame.origin.y+self.mFrame.size.height-2.0f);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, self.mFrame.origin.x+self.mFrame.size.width-2.0f, self.mFrame.origin.y + self.mFrame.size.height*2.0f/3.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+self.mFrame.size.width-2.0f, self.mFrame.origin.y+self.mFrame.size.height-2.0f);
    CGContextAddLineToPoint(context, self.mFrame.origin.x+self.mFrame.size.width*2.0f/3.0f, self.mFrame.origin.y+self.mFrame.size.height-2.0f);
    CGContextStrokePath(context);
}

@end
