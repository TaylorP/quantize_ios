//
//  OBArcadeState.h
//  quanta
//
//  Created by Taylor Petrick on 2012-12-20.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBGrid.h"

#define kMaxLevel 4

@protocol OBArcadeStateDelegate

-(void)timeDidFinish;
-(void)timeDidTick;

@end

@interface OBArcadeState : NSObject < OBGridDelegate>
{
    int         mCurrentSolves;
    int         mGameTime;
    NSTimer*    mGameClock;
    
    int         mCompleteCount[4];
    int         mBubbleCount;
    int         mOverlapCount;
}

@property(nonatomic) bool mFail;
@property(nonatomic) int mLevelNumber;
@property(nonatomic) int mGridSize;
@property(nonatomic, retain) OBGrid* mGrid;
@property(nonatomic, retain) id<OBArcadeStateDelegate> mDelegate;

+ (OBArcadeState*)sharedArcadeState;

- (void)start;
- (bool)isRunning;
- (NSString*)timeString;
- (int)computeScore;

-(int)blueScore;
-(int)greenScore;
-(int)pinkScore;
-(int)orangeScore;
-(int)bubbleScore;
-(int)dupeScore;

@end
