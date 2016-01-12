//
//  ViewController.h
//  QuizApp
//
//  Created by Norimichi Takagi on 2016/01/08.
//  Copyright © 2016年 NorimichiTakagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)maru:(id)sender;
-(IBAction)batu:(id)sender;
-(IBAction)start:(id)sender;
-(IBAction)flashOn:(id)sender;
-(IBAction)flashOff:(id)sender;
@property(nonatomic,weak) IBOutlet UILabel *qNumLabel;
@property(nonatomic,weak) IBOutlet UITextView *questionText;
@property(nonatomic,weak) IBOutlet UILabel *answerText;
@property(nonatomic,weak) IBOutlet UIButton *startReset;
@property(nonatomic,weak) IBOutlet UIButton *maruBt;
@property(nonatomic,weak) IBOutlet UIButton *batuBt;
@property(nonatomic,weak) IBOutlet UIImageView *bgImage;
@end

