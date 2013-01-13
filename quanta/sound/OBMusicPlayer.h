//
//  OBMusicPlayer.h
//  quanta
//
//  Created by Taylor Petrick on 2012-12-20.
//  Copyright (c) 2012 Orange Bytes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface OBMusicPlayer : NSObject
{
    AVAudioPlayer *audioPlayer;
}

///Returns the shared singleton instance of the class
+ (OBMusicPlayer*)sharedMusicPlayer;

///Toggles playing of music
- (void)play:(bool)shouldPlay;

@end
