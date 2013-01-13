//
//  OBTunnel.h
//  quanta
//
//  Created by Taylor Petrick on 2012-12-21.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBElement.h"

@interface OBTunnel : OBElement
{
    float mAlpha;
}

-(id)initWithAlpha:(float)alpha;
- (void)drawInContext:(CGContextRef)context;
@end
