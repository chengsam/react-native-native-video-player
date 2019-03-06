//
//  RNVideoPlayer.m
//  RNVideoPlayer
//
//  Created by DC5 Admin (MACMINI032) on 10/25/16.
//  Copyright © 2016 DC5 Admin (MACMINI032). All rights reserved.
//

#import "RNVideoPlayer.h"

@implementation RNVideoPlayer

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(showVideoPlayer:(NSString *)url)
{
    NSURL *videoURL = [NSURL URLWithString:url];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    dispatch_async(dispatch_get_main_queue(), ^{
        [delegate.window.rootViewController presentViewController:playerViewController animated:YES completion:^{
            [playerViewController.player play];
        }];
    });
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

@end
