//
//  ViewController.m
//  CLSpeechSynthesizer
//
//  Created by 李辉 on 16/1/2.
//  Copyright © 2016年 李辉. All rights reserved.
//

#import "ViewController.h"
#import "CLSpeechSynthesizer.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)playButtonClick:(UIButton *)sender;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置成台湾音
    [CLSpeechSynthesizer setLanguage:@"zh-TW"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonClick:(UIButton *)sender
{
    [CLSpeechSynthesizer playVoice:_textField.text];
}

@end
