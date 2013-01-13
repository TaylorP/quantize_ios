//
// File:    Quanta/Bubble/OBGrid.m
// Author:  Taylor Petrick
// Date:    November 18th, 2012
//

#import "OBGameBubble.h"
#import "OBGameCell.h"
#import "OBTunnel.h"
#import "OBArcadeColors.h"
#import "OBArcadeState.h"
#import "OBGrid.h"


@implementation OBGrid
@synthesize mDelegate;

-(id)initWithSize:(int)gridSize
{
    self = [super init];
    
    if(self)
    {
        mGridSize = gridSize;
        mElements = (OBElement**)malloc(sizeof(OBElement*) * gridSize * gridSize);
        mPointListHead = nil;
        
        for(int i = 0; i<mGridSize*mGridSize; i++)
        {
            mElements[i] = nil;
        }
    }
    return self;
}

- (void)clearGrid
{
    for(int i = 0; i<mGridSize*mGridSize; i++)
    {
        [mElements[i] release];
    }
}

- (void)resizeGrid:(int)newSize
{
    [self clearGrid];
    free(mElements);
    
    mGridSize = newSize;
    mElements = (OBElement**)malloc(sizeof(OBElement*) * mGridSize * mGridSize);
    for(int i = 0; i<mGridSize*mGridSize; i++)
    {
        mElements[i] = nil;
    }
}

- (void)loadArcadeGrid:(int*)puzzleArray
{
    [self clearGrid];
    
    float size = 300.0f/ mGridSize;
    
    for(int i = 0; i<mGridSize * mGridSize; i++)
    {
        switch (puzzleArray[i])
        {
            case eElementEmpty:
            {
                mElements[i] = [[OBGameCell alloc] init];
                [mElements[i] setMFrame:CGRectMake(i%mGridSize * size+10, i/mGridSize * size+10, size-16, size-16)];
                break;
            }
                
            case eElementBubble:
            {
                CGFloat* color = [OBArcadeColors strokeColorForLevel:[OBArcadeState sharedArcadeState].mLevelNumber-1];
                mElements[i] = [[OBGameBubble alloc] initWithRed:color[0] andGreen:color[1] andBlue:color[2]];
                [mElements[i] setMFrame:CGRectMake(i%mGridSize * size+6, i/mGridSize * size+6, size-10, size-10)];
            }
                
            default:
                break;
        }
    }
}

- (void)drawInContext:(CGContextRef)context
{
    CGFloat color[] = {1.0, 1.0, 1.0, 1.0};
    CGContextSetStrokeColor(context, color);
    CGContextSetLineWidth(context, 2.0f);
    
    int step = 300/mGridSize;
    
    for (int i = 0; i <= 300; i += step)
    {
        CGContextMoveToPoint(context, i+1, 0);
        CGContextAddLineToPoint(context, i+1, 302);
        
        CGContextMoveToPoint(context, 0, i+1);
        CGContextAddLineToPoint(context, 302, i+1);
    }
    
    CGContextStrokePath(context);
    
    for (int i = 0; i<mGridSize*mGridSize; i++)
    {
        [mElements[i] drawInContext:context];
    }
    
    if(mPointListHead != nil)
    {
        CGContextSetStrokeColor(context, color);
        CGContextSetLineWidth(context, 4.0f);
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineCap(context, kCGLineCapRound);
        
        OBPointList* tempList = mPointListHead.mChild;
        CGContextMoveToPoint(context, mPointListHead.mPoint.x, mPointListHead.mPoint.y);
        while(tempList)
        {
            CGContextAddLineToPoint(context, tempList.mPoint.x, tempList.mPoint.y);
            CGContextMoveToPoint(context, tempList.mPoint.x, tempList.mPoint.y);

            tempList = tempList.mChild;
        }
        
         CGContextStrokePath(context);
    }
}

-(void)startPointing
{
    mPointList = [[OBPointList alloc] init];
    mPointListHead = mPointList;
    
    mLastCell = -1;
}

-(void)addPoint:(CGPoint)point
{
    int x = point.x / (300/mGridSize);
    int y = point.y / (300/mGridSize);
    int cell = x + mGridSize*y;
    
    if (cell >=  mGridSize*mGridSize)
    {
        [mDelegate didFail];
        [self donePointing:true];
        return;
    }
    
    if(cell < mGridSize*mGridSize && cell != mLastCell && [mElements[cell] collisionTest:point] )
    {
        if (mElements[cell].mType == eElementBubble)
        {
            [mDelegate didPopBubble];
            [mDelegate didFail];
            [self donePointing:true];
            return;
        }
        
        mLastCell = cell;
        
        mPointList.mPoint = CGPointMake((x+1)*300/mGridSize - 300/mGridSize/2.0f, (y+1)*300/mGridSize - 300/mGridSize/2.0f);
        mPointList.mChild = [[OBPointList alloc] init];
        mPointList = mPointList.mChild;
        mPointList.mPoint = point;
        if(mElements[cell].mType == eElementEmpty)
        {
            ((OBGameCell*)mElements[cell]).mSelected = true;
            ((OBGameCell*)mElements[cell]).mHitCount++;
        }
    }
    else
    {
        mPointList.mPoint = point;
    }
}

-(void)donePointing:(bool)abort
{
    mPointList = mPointListHead;
    
    while (mPointList != nil)
    {
        mPointListHead = mPointListHead.mChild;
        [mPointList release];
        mPointList = mPointListHead;
    }
    mPointListHead = nil;

    bool failed = false;
    for(int i = 0; i<mGridSize*mGridSize; i++)
    {
        if(mElements[i].mType == eElementEmpty)
        {
            if(((OBGameCell*)mElements[i]).mHitCount == 0)
            {
                failed = true;
            }
        }
    }
    
    if(!failed && !abort)
    {
        int overlapCount = 0;
        for(int i = 0; i<mGridSize*mGridSize; i++)
        {
            if(mElements[i].mType == eElementEmpty)
            {
                if(((OBGameCell*)mElements[i]).mHitCount > 1)
                    overlapCount++;
            }
        }
        
        [mDelegate didComplete:overlapCount];
    }
    else
    {
        for(int i = 0; i<mGridSize*mGridSize; i++)
        {
            if(mElements[i].mType == eElementEmpty)
            {
                ((OBGameCell*)mElements[i]).mSelected = false;
                ((OBGameCell*)mElements[i]).mHitCount = 0;
            }
        }
    }
}

@end
