# CLSpeechSynthesizer 1.0
封装iOS自带的语音合成器

<br />
作者：李辉 <br />
联系方式：6545823@qq.com <br />
编译环境：Xcode 7.2 <br />
运行环境：iOS 9.2 运行正常 <br />
您在使用该控件的过程中，如有任何疑问或建议，请通过邮箱联系我，谢谢！ <br />


使用方法
===============

  在 AppDelegate.m 中做初始化
  #import "CLSpeechSynthesizer.h"
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
  {
    // 初始化合成器的后台播放
    [CLSpeechSynthesizer initPlayback];
    return YES;
  }
  
  在其他页面中使用
  #import "CLSpeechSynthesizer.h"
    
  // 播放语音
  [CLSpeechSynthesizer playVoice:@"测试播放语音"];
    
  // 如需要设置播放语音的语言，则使用setLanguage，例：设置台湾音
  [CLSpeechSynthesizer setLanguage:@"zh-TW"];
      

详细的示例请参考代码。 <br />

历史版本
===============
v1.0 - 2016-01-03 <br />
Added <br />
基础功能完成 <br />
