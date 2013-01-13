//
//  OBMusicPlayer.m
//  quanta
//
//  Created by Taylor Petrick on 2012-12-20.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import "OBMusicPlayer.h"
#import "OBUserPreferences.h"

@implementation OBMusicPlayer

static OBMusicPlayer* sharedMusicPlayer;

+ (OBMusicPlayer *)sharedMusicPlayer
{
    if (sharedMusicPlayer == nil)
    {
        sharedMusicPlayer = [[OBMusicPlayer alloc] init];
    }
    
    return  sharedMusicPlayer;
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/OBMusic0.aif", [[NSBundle mainBundle] resourcePath]]];
        
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        audioPlayer.numberOfLoops = -1;
        
        if (audioPlayer == nil)
            NSLog(@"%@",[error description]);
        
        
        [self play: ![[OBUserPreferences sharedPreferences] getBoolPreference:kOBPreferenceMusic]];
    }
    
    return self;
}

-(void)play:(bool)shouldPlay
{
    if(shouldPlay && audioPlayer != nil)
        [audioPlayer play];
    else
        [audioPlayer stop];
}


@end
