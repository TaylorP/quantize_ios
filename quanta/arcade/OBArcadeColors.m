//
// File:    Quanta/Arcade/OBArcadeColors.m
// Author:  Taylor Petrick
// Date:    December 21st, 2012
//

#import "OBArcadeColors.h"

@implementation OBArcadeColors

static CGFloat blueSColor[]   = {0.1, 0.5, 1.0, 0.85};
static CGFloat greenSColor[]  = {0.4, 1.0, 0.1, 0.85};
static CGFloat pinkSColor[]   = {1.0, 0.0, 0.5, 0.85};
static CGFloat orangeSColor[] = {1.0, 0.5, 0.0, 0.85};
static CGFloat nullSColor[]   = {0.4, 0.4, 0.4, 0.7};

static CGFloat blueFColor[]   = {0.1, 0.5, 1.0, 0.43};
static CGFloat greenFColor[]  = {0.4, 1.0, 0.1, 0.43};
static CGFloat pinkFColor[]   = {1.0, 0.0, 0.5, 0.43};
static CGFloat orangeFColor[] = {1.0, 0.5, 0.0, 0.43};
static CGFloat nullFColor[]   = {0.4, 0.4, 0.4, 0.35};

+ (CGFloat*)strokeColorForLevel:(int)level
{
    switch (level)
    {
        case -1:
            return nullSColor;
            
        case 0:
            return blueSColor;
            
        case 1:
            return greenSColor;
            
        case 2:
            return pinkSColor;

        default:
            return orangeSColor;
            break;
    }
}

+ (CGFloat*)fillColorForLevel:(int)level
{
    switch (level)
    {
        case -1:
            return nullFColor;
            
        case 0:
            return blueFColor;
            
        case 1:
            return greenFColor;
            
        case 2:
            return pinkFColor;
            
        default:
            return orangeFColor;
            break;
    }
}

@end
