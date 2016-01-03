//
//  CLSpeechSynthesizer.h
//  CLSpeechSynthesizer
//
//  Created by 李辉 on 16/1/2.
//  Copyright © 2016年 李辉. All rights reserved.
//  https://github.com/changelee82/CLSpeechSynthesizer
//

#import <Foundation/Foundation.h>


@class AVSpeechSynthesisVoice;


/**  封装iOS自带的语音合成器 */
@interface CLSpeechSynthesizer : NSObject

/**  是否启用，默认为YES */
@property (nonatomic, assign) BOOL enabled;

/**  语音播报的的嗓音，默认中文，zh-CN */
@property (nonatomic, strong) AVSpeechSynthesisVoice *voice;


/**  初始化合成器的后台播放，必须在application:didFinishLaunchingWithOptions:中调用 */
+ (BOOL)initPlayback;

/**  播放语音，使用单例 */
+ (void)playVoice:(NSString *)voiceText;

/**  设置单例的播放语言 */
+ (BOOL)setLanguage:(NSString *)voiceLanguage;


/**  单例模式 */
+ (CLSpeechSynthesizer *)sharedInstance;
/**  播放语音 */
- (void)playVoice:(NSString *)voiceText;
/**  设置播放语言 */
- (BOOL)setLanguage:(NSString *)voiceLanguage;


@end
