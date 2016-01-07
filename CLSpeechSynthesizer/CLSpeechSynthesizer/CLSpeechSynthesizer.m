//
//  CLSpeechSynthesizer.m
//  CLSpeechSynthesizer
//
//  Created by 李辉 on 16/1/2.
//  Copyright © 2016年 李辉. All rights reserved.
//  https://github.com/changelee82/CLSpeechSynthesizer
//

#import "CLSpeechSynthesizer.h"
#import <AVFoundation/AVFoundation.h>


@interface CLSpeechSynthesizer()

/**  语音合成器 */
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

@end



@implementation CLSpeechSynthesizer

- (instancetype)init
{
    if(self = [super init]) {
        _enabled = YES;
        _voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return self;
}

/**  初始化后台播放，在application:didFinishLaunchingWithOptions:中调用 */
+ (BOOL)initPlayback
{
    NSError *error = NULL;
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:&error];
    if(error)
    {
        return NO;
    }
    [session setActive:YES error:&error];
    if (error)
    {
        return NO;
    }
    
    // 为了避免卡顿，先播放一次
    [[self sharedInstance] playVoice:@" "];
    
    return YES;
}

/**  单例模式 */
+ (CLSpeechSynthesizer *)sharedInstance
{
    __strong static CLSpeechSynthesizer* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

/**  播放语音，使用单例 */
+ (void)playVoice:(NSString *)voiceText
{
    [[self sharedInstance] playVoice:voiceText];
}

/**  设置单例的播放语言 */
+ (BOOL)setLanguage:(NSString *)voiceLanguage
{
    return [[CLSpeechSynthesizer sharedInstance] setLanguage:voiceLanguage];
}

/**  播放语音 */
- (void)playVoice:(NSString *)voiceText
{
    if(_enabled == NO)
        return;
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:voiceText];
    utterance.voice = _voice;
    utterance.volume = 1.0; // 设置音量 [0-1] Default = 1
    utterance.rate = 0.5;   // 设置语速
    utterance.pitchMultiplier = 1;    // 设置语调，可能是高低音 [0.5 - 2] Default = 1
    
    [_synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];    // 播放前清空其他语音
    [_synthesizer speakUtterance:utterance];
}

/**  设置播放语言 */
- (BOOL)setLanguage:(NSString *)voiceLanguage
{
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:voiceLanguage];
    if (voice)
    {
        self.voice = voice;
        return YES;
    }
    
    return NO;
}

@end



