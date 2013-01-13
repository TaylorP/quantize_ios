//
//  OBArcadeState.m
//  quanta
//
//  Created by Taylor Petrick on 2012-12-20.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBArcadeState.h"
#import "OBArcadeGen.h"

@implementation OBArcadeState

@synthesize mLevelNumber, mGridSize, mGrid, mFail;

static OBArcadeState* sharedArcadeState;

+ (OBArcadeState*)sharedArcadeState
{
    if (sharedArcadeState == nil)
    {
        sharedArcadeState = [[OBArcadeState alloc] init];
    }
    
    return sharedArcadeState;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        mLevelNumber = 1;
        mGridSize = 3;
        
        mCurrentSolves = 0;
        mGameTime = 60;
        mGameClock = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
        
        mGrid = [[OBGrid alloc] initWithSize:mGridSize];
        mGrid.mDelegate = self;
    }
    
    return self;
}

- (void)start
{
    mLevelNumber = 1;
    mGridSize = 3;
    mCurrentSolves = 0;
    mGameTime = 60;
    
    mCompleteCount[0] = 0;
    mCompleteCount[1] = 0;
    mCompleteCount[2] = 0;
    mCompleteCount[3] = 0;
    
    mBubbleCount = 0;
    mOverlapCount = 0;
    
    [mGameClock invalidate];
    
    mGameClock = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    
    [mGrid resizeGrid:mGridSize];
    [self generatePuzzle];
}

-(int)computeScore
{
    int count = mCompleteCount[0] + mCompleteCount[1] * 2 + mCompleteCount[2] * 3 + mCompleteCount[3] * 4;
    
    count -= mBubbleCount*4;
    count -= mOverlapCount*2;
    
    count = MAX(count, 0);
    
    return count;
}

-(int)blueScore
{
    return mCompleteCount[0];
}

-(int)greenScore
{
    return mCompleteCount[1];
}

-(int)pinkScore
{
    return mCompleteCount[2];
}

-(int)orangeScore
{
    return mCompleteCount[3];
}

-(int)bubbleScore
{
    return mBubbleCount;
}

-(int)dupeScore
{
    return mOverlapCount;
}

-(void)tick
{
    mGameTime--;
    [self.mDelegate timeDidTick];
    
    if(mGameTime == 0)
        [self.mDelegate timeDidFinish];
}

- (bool)isRunning
{
    return mGameTime >= 0;
}

- (NSString*)timeString
{
    if (mGameTime <= 0)
    {
        return @"0:00";
    }
    else if (mGameTime <= 9)
    {
        return [NSString stringWithFormat:@"0:0%i",mGameTime];
    }
    else if(mGameTime <= 59)
    {
        return [NSString stringWithFormat:@"0:%i",mGameTime];
    }
    else if(mGameTime%60 <= 9)
    {
        return [NSString stringWithFormat:@"%i:0%i",mGameTime/60,mGameTime%60];
    }
    else
    {
        return [NSString stringWithFormat:@"%i:%i",mGameTime/60,mGameTime%60];
    }
}

- (void)incrementLevels
{
    mCompleteCount[mLevelNumber-1]++;
    
    mCurrentSolves++;
    
    if(mLevelNumber < 4 && mCurrentSolves == 3)
    {
        mLevelNumber++;
        mGridSize++;
        mCurrentSolves = 0;
        
        [mGrid resizeGrid:mGridSize];
    }
}

- (void)didComplete:(int)overlapCount;
{
    mOverlapCount += overlapCount;
    [self incrementLevels];
    [self generatePuzzle];
}

-(void)didPopBubble
{
    mBubbleCount++;
}

-(void)didFail
{
    mFail = true;
}

- (void)generatePuzzle
{
    int* puzzle = createArray(mGridSize);
    
    [mGrid loadArcadeGrid:puzzle];
}

@end
