//
//  ViewController.h
//  Comobot_wifi_demo
//
//  Created by zzy on 17/6/20.
//  Copyright © 2017年 com.comobd.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)startNow:(UIButton *)sender;
- (IBAction)stopNow:(UIButton *)sender;
- (IBAction)settingS:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;


@end

