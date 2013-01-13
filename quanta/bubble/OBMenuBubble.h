//
// File:    Quanta/Bubble/OBMenuBubble.h
// Author:  Taylor Petrick
// Date:    October 27th, 2012
//

#import "OBBubble.h"

///A class for the bubble that are rendered in the main menu background
@interface OBMenuBubble : OBBubble
{
}

///The time, for fading in/out
@property(nonatomic) int mTime;

///A flag indicating the bubble should be deleted
@property(nonatomic) bool mDelete;

///Update the bubble's time and alpha
- (void)tick;

@end
