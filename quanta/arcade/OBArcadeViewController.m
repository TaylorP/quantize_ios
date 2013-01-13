//
//  OBArcadeViewController.m
//  quanta
//
//  Created by Taylor Petrick on 2012-10-28.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBArcadeViewController.h"
#import "OBArcadeState.h"

@interface OBArcadeViewController ()

@end

@implementation OBArcadeViewController
@synthesize mArcadeView, mArcadeLevelView, mTimeLabel, mScoreView;
@synthesize mBlueScore, mGreenScore, mPinkScore, mOrangeScore, mBubbleScore, mDupeScore, mTotal;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [OBArcadeState sharedArcadeState].mDelegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backToMenu:(id)sender
{
    [OBArcadeState sharedArcadeState].mDelegate = nil;
    
    [self dismissViewControllerAnimated:true completion:nil];
}

-(IBAction)restart:(id)sender
{
    if ([[OBArcadeState sharedArcadeState] isRunning])
    {
        [UIView animateWithDuration:0.75 animations:^(void)
         {
             [mArcadeView setAlpha:0.0f];
             [mArcadeLevelView setAlpha:0.0f];
             [mTimeLabel setAlpha:0.0f];
         } completion:^(BOOL completetion)
         {
             [[OBArcadeState sharedArcadeState] start];
             [mTimeLabel setText:@"1:00"];
             
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  [mArcadeView setAlpha:1.0f];
                  [mArcadeLevelView setAlpha:1.0f];
                  [mTimeLabel setAlpha:1.0f];
              } completion:^(BOOL completetion)
              {
                  
              }
              ];
         }
         ];
    }
    else
    {
        [mScoreView setHidden:YES];
        [mArcadeView setHidden:NO];
        [mArcadeLevelView setHidden:NO];
        [mTimeLabel setHidden:NO];
        [[OBArcadeState sharedArcadeState] start];
        
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             [mArcadeView setAlpha:1.0f];
             [mArcadeLevelView setAlpha:1.0f];
             [mTimeLabel setAlpha:1.0f];
         } completion:^(BOOL completetion)
         {
         }
         ];
    }
}

-(void)timeDidFinish
{
    [mScoreView setAlpha:0.0f];
    [mScoreView setHidden:NO];
    
    [mBlueScore setText: [NSString stringWithFormat:@"1x   %i",[[OBArcadeState sharedArcadeState] blueScore]]];
    [mGreenScore setText: [NSString stringWithFormat:@"2x   %i",[[OBArcadeState sharedArcadeState] greenScore]]];
    [mPinkScore setText: [NSString stringWithFormat:@"3x   %i",[[OBArcadeState sharedArcadeState] pinkScore]]];
    [mOrangeScore setText: [NSString stringWithFormat:@"4x   %i",[[OBArcadeState sharedArcadeState] orangeScore]]];
    
    [mBubbleScore setText: [NSString stringWithFormat:@"-4x   %i",[[OBArcadeState sharedArcadeState] bubbleScore]]];
    [mDupeScore setText: [NSString stringWithFormat:@"-2x   %i",[[OBArcadeState sharedArcadeState] dupeScore]]];
    
    [mTotal setText: [NSString stringWithFormat:@"%i",[[OBArcadeState sharedArcadeState] computeScore]]];
    
    [UIView animateWithDuration:0.5 animations:^(void)
     {
         [mArcadeView setAlpha:0.0f];
         [mArcadeLevelView setAlpha:0.0f];
         [mTimeLabel setAlpha:0.0f];
     } completion:^(BOOL completetion)
     {
         [UIView animateWithDuration:0.5 animations:^(void)
          {
              [mScoreView setAlpha:1.0f];
          }];
         
         [mArcadeView setHidden:YES];
         [mArcadeLevelView setHidden:YES];
         [mTimeLabel setHidden:YES];
     }
     ];
}

-(void)timeDidTick
{
    [mTimeLabel setText:[[OBArcadeState sharedArcadeState] timeString]];
}


@end
