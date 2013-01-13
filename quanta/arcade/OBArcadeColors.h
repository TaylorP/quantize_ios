//
// File:    Quanta/Arcade/OBArcadeColors.h
// Author:  Taylor Petrick
// Date:    December 21st, 2012
//

#import <Foundation/Foundation.h>

/// Simple static class for getting the colors of bubbles depending on the level
@interface OBArcadeColors : NSObject
{
    
}

/// Gets the outline color for the given level
+ (CGFloat*)strokeColorForLevel:(int)level;

/// Gets the fill color for the given level
+ (CGFloat*)fillColorForLevel:(int)level;

@end
