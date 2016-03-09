//
//  ViewController.m
//  VideoBackGround
//
//  Created by MADAO on 16/3/9.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, strong) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"moments" ofType:@"mp4"];
    NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
    
    AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:sourceMovieURL options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
//    self.player = [AVPlayer playerWithPlayerItem:playerItem];
    self.player = [AVPlayer playerWithURL:sourceMovieURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = self.view.layer.bounds;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    
    [self.view.layer addSublayer:playerLayer];
    [self.player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playAgin) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

- (void)playAgin
{
    [self.player seekToTime:CMTimeMake(0, 30)];
    [self.player play];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
