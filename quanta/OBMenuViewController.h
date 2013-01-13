//
//  OBViewController.h
//  quanta
//
//  Created by Taylor Petrick on 2012-10-28.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OBMenuViewController : UIViewController
{
    BOOL            settingsOpen;
    
    BOOL            musicPref;
    BOOL            soundPref;
    BOOL            gcPref;
}

@property(nonatomic, retain) IBOutlet UIView* mainMenu;
@property(nonatomic, retain) IBOutlet UIView* settingsMenu;

@property(nonatomic, retain) IBOutlet UIButton* musicButton;
@property(nonatomic, retain) IBOutlet UIButton* soundButton;
@property(nonatomic, retain) IBOutlet UIButton* gcButton;

@property(nonatomic, retain) IBOutlet UILabel*  musicOn;
@property(nonatomic, retain) IBOutlet UILabel*  soundOn;
@property(nonatomic, retain) IBOutlet UILabel*  gcOn;

- (IBAction)toggleLevels:(id)sender;
- (IBAction)toggleBuilder:(id)sender;
- (IBAction)toggleArcade:(id)sender;

- (IBAction)toggleSettings:(id)sender;
- (IBAction)toggleMusicPref:(id)sender;
- (IBAction)toggleSoundPref:(id)sender;
- (IBAction)toggleGCPref:(id)sender;

- (IBAction)toggleHelp:(id)sender;

@end
