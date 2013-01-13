//
//  OBArcadeViewController.h
//  quanta
//
//  Created by Taylor Petrick on 2012-10-28.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBArcadeView.h"
#import "OBArcadeLevelView.h"
#import "OBArcadeState.h"

@interface OBArcadeViewController : UIViewController <OBArcadeStateDelegate>
{
    
}
@property (nonatomic, retain) IBOutlet OBArcadeView* mArcadeView;
@property (nonatomic, retain) IBOutlet OBArcadeLevelView* mArcadeLevelView;
@property (nonatomic, retain) IBOutlet UILabel* mTimeLabel;
@property (nonatomic, retain) IBOutlet UIView* mScoreView;

@property (nonatomic, retain) IBOutlet UILabel* mBlueScore;
@property (nonatomic, retain) IBOutlet UILabel* mGreenScore;
@property (nonatomic, retain) IBOutlet UILabel* mPinkScore;
@property (nonatomic, retain) IBOutlet UILabel* mOrangeScore;
@property (nonatomic, retain) IBOutlet UILabel* mBubbleScore;
@property (nonatomic, retain) IBOutlet UILabel* mDupeScore;
@property (nonatomic, retain) IBOutlet UILabel* mTotal;

-(IBAction)backToMenu:(id)sender;
-(IBAction)restart:(id)sender;

@end
