//
// File:    Quanta/Bubble/OBMenuBubble.m
// Author:  Taylor Petrick
// Date:    October 27th, 2012
//

#import "OBMenuBubble.h"

@implementation OBMenuBubble
@synthesize mTime, mDelete;

-(id)init
{
    self = [super init];
    
    if (self)
    {
        mTime = 0;
        mDelete = false;
    }
    
    return self;
}

-(void)tick
{
    mTime++;
    
    float x = mTime/50.0f;
    self.mAlpha = -0.3f*((x-0.7f) * (x-0.7f)) + 0.16f;
    self.mAlpha *= 0.5;
    
    if (self.mAlpha <= 0.0f)
    {
        mDelete = true;
    }
}

@end
