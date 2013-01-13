//
// File:    Quanta/Bubble/OBGrid.h
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//

#import <UIKit/UIKit.h>
#import "OBElement.h"
#import "OBPointList.h"

@protocol OBGridDelegate

-(void)didPopBubble;
-(void)didFail;
-(void)didComplete:(int)overlapCount;

@end

/// A game grid of size 3x3 to 6x6
@interface OBGrid : NSObject
{
    OBElement** mElements;
    int mGridSize;
    
    OBPointList* mPointListHead;
    OBPointList* mPointList;
    int          mLastCell;
}
@property (nonatomic, retain) id<OBGridDelegate> mDelegate;

///Inits the grid
- (id)initWithSize:(int)gridSize;

/// Clears the grid
- (void)clearGrid;

/// Resizes the grid
- (void)resizeGrid:(int)newSize;

/// Loads the grid from an array
- (void)loadArcadeGrid:(int*)puzzleArray;

/// Draws the grid in a given context
- (void)drawInContext:(CGContextRef)context;

/// Starts adding to the point list
- (void)startPointing;

/// Adds a point
- (void)addPoint:(CGPoint)point;

/// Done pointing
- (void)donePointing:(bool)abort;

@end
