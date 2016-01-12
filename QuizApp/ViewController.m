//
//  ViewController.m
//  QuizApp
//
//  Created by Norimichi Takagi on 2016/01/08.
//  Copyright © 2016年 NorimichiTakagi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
NSInteger num;
NSInteger qNum;
NSInteger q1,q2,q3,q4,q5;
NSInteger score;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 正解の設定 10の位が問数 1の位が1ならマル、2ならバツが正解//
    // 問１
    q1 = 10 + 1 ;
    // 問２
    q2 = 20 + 2 ;
    // 問３
    q3 = 30 + 2 ;
    // 問４
    q4 = 40 + 1 ;
    // 問５
    q5 = 50 + 1 ;
    
    _maruBt.hidden = YES;
    _batuBt.hidden = YES;
}

// 画面フラッシュ
-(IBAction)flashOn:(id)sender{
    _bgImage.hidden = NO;
    _bgImage.image = [UIImage imageNamed:(@"flash.png")];
    
}
-(IBAction)flashOff:(id)sender{
    _bgImage.hidden = YES;
}

    // スタートボタン後
-(IBAction)start:(id)sender{
    num = 0 ;
    qNum = 10;
    score = 0;
    [self questionView];
    [_answerText setText:@""];
    _answerText.backgroundColor = [UIColor clearColor];
    [_startReset setTitle:@"最初から" forState:UIControlStateNormal];
    NSLog(@"スタート");
    _maruBt.hidden = NO;
    _batuBt.hidden = NO;
    _maruBt.alpha = 1;
    _batuBt.alpha = 1;
    
}

    // 問題の表示
-(void)questionView{
    
    if(qNum < 20){
        _qNumLabel.text = @"問１";
        [_questionText setText:@"我が社の代表は”世一英仁”である"];}
    else if(qNum < 30){
        _qNumLabel.text = @"問２";
         [_questionText setText:@"マネージャーは全部で”４人”いる"];}
    else if(qNum < 40){
        _qNumLabel.text = @"問３";
         [_questionText setText:@"ディビジョンは全部で”５つ”ある"];}
    else if(qNum < 50){
        _qNumLabel.text = @"問４";
         [_questionText setText:@"2015年の社員旅行は”11月の沖縄”だった"];}
    else if(qNum < 60){
        _qNumLabel.text = @"問５";
         [_questionText setText:@"”マーケティングディビジョン”が存在していた時期がある"];}
    // 解答終了後
    else{
        _qNumLabel.text = @"結果発表";
        NSInteger integer = score;
        [_questionText setText:[NSString stringWithFormat:@"あなたの正解率は%ld％です!",(long)integer]];
        // ボタン停止
        _maruBt.alpha = 0;
        _batuBt.alpha = 0;
    }
}

    // 解答情報を変数に代入
- (IBAction)maru:(id)sender{
    num = 1 ;
    [self answer];
}
- (IBAction)batu:(id)sender{
    num = 2 ;
    [self answer];
    
}

    // 解答表示ロジック
-(void)answer{
    NSInteger aNum = qNum + num;
    if (aNum == q1 || aNum == q2 || aNum == q3 || aNum == q4 || aNum == q5 ){
        [_answerText setText:@"正解！"];
        _answerText.backgroundColor = [UIColor orangeColor];
        score += 20;
    }else{
        [_answerText setText:@"不正解！"];
        _answerText.backgroundColor = [UIColor blueColor];
    }
    
    // ボタン一時停止
    _maruBt.hidden = YES;
    _batuBt.hidden = YES;
    
    // タップ後動作
    NSLog(@"アンサー");
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(nsTimerAction:)
                                   userInfo:nil
                                    repeats:NO];
}

    // 正解表示の解除 & 次の問へ
- (void)nsTimerAction:(NSTimer*)timer
{
    // 次の問題へ
    qNum += 10;
    [self questionView];
    // ボタン再表示
    _maruBt.hidden = NO;
    _batuBt.hidden = NO;
    // 正解表示リセット
    [_answerText setText:@""];
    _answerText.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
