//
//  OBViewController.m
//  quanta
//
//  Created by Taylor Petrick on 2012-10-28.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBMenuViewController.h"
#import "OBPreferences.h"
#import "OBUserPreferences.h"
#import "OBMusicPlayer.h"
#import "OBArcadeViewController.h"
#import "OBBuilderViewController.h"
#import "OBArcadeState.h"

@interface OBMenuViewController ()

@end

@implementation OBMenuViewController
@synthesize mainMenu, settingsMenu;
@synthesize musicButton, soundButton, gcButton;
@synthesize musicOn, soundOn, gcOn;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    musicPref   = [[OBUserPreferences sharedPreferences] getBoolPreference:kOBPreferenceMusic];
    soundPref   = [[OBUserPreferences sharedPreferences] getBoolPreference:kOBPreferenceSound];
    gcPref      = [[OBUserPreferences sharedPreferences] getBoolPreference:kOBPreferenceGameCenter];
    
    [self setMusicPref];
    [self setSoundPref];
    [self setGCPref];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleLevels:(id)sender
{
    
}

- (IBAction)toggleArcade:(id)sender
{
    [[OBArcadeState sharedArcadeState] start];
    
    OBArcadeViewController* arcadeView = [[OBArcadeViewController alloc] init];
    arcadeView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:arcadeView animated:YES completion:nil];
}

- (IBAction)toggleBuilder:(id)sender
{
    OBBuilderViewController* builderView = [[OBBuilderViewController alloc] init];
    builderView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:builderView animated:YES completion:nil];
}

- (IBAction)toggleHelp:(id)sender
{
    
}

- (IBAction)toggleSettings:(id)sender
{
    if (!settingsOpen)
    {
        [UIView animateWithDuration: 0.3f
                         animations: ^(void)
         {
             [mainMenu setAlpha:0.4f];
             [settingsMenu setAlpha:1.0f];
             [mainMenu setFrame:CGRectMake(-320, 0, 320, 480)];
             [settingsMenu setFrame:CGRectMake(0, 0, 320, 480)];
         }
                         completion:^(BOOL finished)
         {
             settingsOpen = YES;
         }];
    }
    else
    {
        [UIView animateWithDuration: 0.3f
                         animations: ^(void)
         {
             [mainMenu setAlpha:1.0f];
             [settingsMenu setAlpha:0.4f];
             
             [mainMenu setFrame:CGRectMake(0, 0, 320, 480)];
             [settingsMenu setFrame:CGRectMake(320, 0, 320, 480)];
         }
                         completion:^(BOOL finished)
         {
             settingsOpen = NO;
         }];
    }
}

- (IBAction)toggleMusicPref:(id)sender
{
    musicPref = !musicPref;
    [[OBUserPreferences sharedPreferences] setPreference:kOBPreferenceMusic withBool:musicPref];
    [[OBUserPreferences sharedPreferences] savePreferences];
    
    [[OBMusicPlayer sharedMusicPlayer] play:!musicPref];
    
    [self setMusicPref];
}

-(void)setMusicPref
{
    if (musicPref)
    {
        [musicButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.3f] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             [musicOn setText:@"off"];
             [musicOn setAlpha:0.9f];
         }
         completion:^(BOOL completion)
         {
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  [musicOn setAlpha:0.0f];
              }];
         }];
        
    }
    else
    {
        [musicButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:1.0f] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             [musicOn setText:@"on"];
             [musicOn setAlpha:0.9f];
         }
                         completion:^(BOOL completion)
         {
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  [musicOn setAlpha:0.0f];
              }];
         }];
    }
}

- (IBAction)toggleSoundPref:(id)sender
{
    soundPref = !soundPref;
    
    [[OBUserPreferences sharedPreferences] setPreference:kOBPreferenceSound withBool:soundPref];
    [[OBUserPreferences sharedPreferences] savePreferences];
    
    [self setSoundPref];
}

-(void)setSoundPref
{
    if (soundPref)
    {
        [soundButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.3f] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             [soundOn setText:@"off"];
             [soundOn setAlpha:0.9f];
         }
                         completion:^(BOOL completion)
         {
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  [soundOn setAlpha:0.0f];
              }];
         }];
        
    }
    else
    {
        [soundButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:1.0f] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             [soundOn setText:@"on"];
             [soundOn setAlpha:0.9f];
         }
                         completion:^(BOOL completion)
         {
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  [soundOn setAlpha:0.0f];
              }];
         }];
    }

}

-(IBAction)toggleGCPref:(id)sender
{
    gcPref = !gcPref;
    
    [[OBUserPreferences sharedPreferences] setPreference:kOBPreferenceGameCenter withBool:gcPref];
    [[OBUserPreferences sharedPreferences] savePreferences];
    
    [self setGCPref];
}

-(void)setGCPref
{
    if (gcPref)
    {
        [gcButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.3f] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             [gcOn setText:@"off"];
             [gcOn setAlpha:0.9f];
         }
                         completion:^(BOOL completion)
         {
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  [gcOn setAlpha:0.0f];
              }];
         }];
        
    }
    else
    {
        [gcButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:1.0f] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^(void)
         {
             [gcOn setText:@"on"];
             [gcOn setAlpha:0.9f];
         }
                         completion:^(BOOL completion)
         {
             [UIView animateWithDuration:0.5 animations:^(void)
              {
                  [gcOn setAlpha:0.0f];
              }];
         }];
    }
    
}

@end
