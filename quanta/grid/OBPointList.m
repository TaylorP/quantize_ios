//
//  OBPointList.m
//  quanta
//
//  Created by Taylor Petrick on 2012-12-20.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBPointList.h"

@implementation OBPointList

@synthesize mChild, mPoint;

-(id)init
{
    self = [super init];
    if(self)
    {
        mChild = nil;
    }
    return self;
}

@end
