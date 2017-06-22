//
//  ViewController.m
//  Comobot_wifi_demo
//
//  Created by zzy on 17/6/20.
//  Copyright © 2017年 com.comobd.io. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    NSArray * letter;
    NSString *pickStr;
}

@end

@implementation ViewController
-(void)viewDidLayoutSubviews
{
    self.myScrollView.contentSize = CGSizeMake(300,1080);
}
- (void)viewDidLoad {
    [super viewDidLoad];

    pickStr = [[NSString alloc]init];
    [self.myScrollView setBackgroundColor:[UIColor blackColor]];
    [self creatText];
    letter = @[@"km",@"m"];
}
-(void)creatText{
        CGRect r = [ UIScreen mainScreen ].bounds;
     UITextField *textF1 = [[UITextField alloc]init];
     UITextField *textF2 = [[UITextField alloc]init];
     UITextField *textF3 = [[UITextField alloc]init];
     UITextField *textF4 = [[UITextField alloc]init];
     UITextField *textF5 = [[UITextField alloc]init];
     UITextField *textF6 = [[UITextField alloc]init];
     UITextField *textF7 = [[UITextField alloc]init];
     UITextView *textF8 = [[UITextView alloc]init];
     UITextView *textF9 = [[UITextView alloc]init];
     UITextView *textF10 = [[UITextView alloc]init];
    [self.myScrollView addSubview:textF1];
    [self.myScrollView addSubview:textF2];
    [self.myScrollView addSubview:textF3];
    [self.myScrollView addSubview:textF4];
    [self.myScrollView addSubview:textF5];
    [self.myScrollView addSubview:textF6];
    [self.myScrollView addSubview:textF7];
    [self.myScrollView addSubview:textF8];
    [self.myScrollView addSubview:textF9];
    [self.myScrollView addSubview:textF10];
    [textF1 setBackgroundColor:[UIColor whiteColor]];
    [textF2 setBackgroundColor:[UIColor whiteColor]];
    [textF3 setBackgroundColor:[UIColor whiteColor]];
    [textF4 setBackgroundColor:[UIColor whiteColor]];
    [textF5 setBackgroundColor:[UIColor whiteColor]];
    [textF6 setBackgroundColor:[UIColor whiteColor]];
    [textF7 setBackgroundColor:[UIColor whiteColor]];
    [textF8 setBackgroundColor:[UIColor whiteColor]];
    [textF9 setBackgroundColor:[UIColor whiteColor]];
    [textF10 setBackgroundColor:[UIColor whiteColor]];
    [textF8 setFont:[UIFont systemFontOfSize:18]];
    [textF9 setFont:[UIFont systemFontOfSize:18]];
    [textF10 setFont:[UIFont systemFontOfSize:18]];
    textF1.enabled = NO;
    textF2.enabled = NO;
    textF3.enabled = NO;
    textF4.enabled = NO;
    textF5.enabled = NO;
    textF6.enabled = NO;
    textF7.enabled = NO;
    textF8.userInteractionEnabled = NO;
    textF9.userInteractionEnabled = NO;
    textF10.userInteractionEnabled = NO;
    [textF1 setText:@"Engine powe status >xxxxxxxxx"];
    [textF2 setText:@"Miles driven > 0.7(km) 0.4(mile)"];
    [textF3 setText:@"Engine hours > 0.7(min) "];
    [textF4 setText:@"Total engine hours > xxxxxxx"];
    [textF5 setText:@"Engine RPM > XXXXXXXX"];
    [textF6 setText:@"Odometer > xxxxxxxx"];
    [textF7 setText:@"GPS data > xxxxxxxx"];
    [textF8 setText:@"OBD data >\n xxxxxxxxxxx "];
    [textF9 setText:@"Fault code >\n xxxxxxxxx"];
    [textF10 setText:@"Engine power status>\n xxxxxxx"];
    [textF1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(self.myScrollView).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF1.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF2.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF3.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF4.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF5.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF6.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF7.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 300));
    }];
    [textF9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF8.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];
    [textF10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myScrollView);
        make.top.equalTo(textF9.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(r.size.width, 59));
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startNow:(UIButton *)sender {
}

- (IBAction)stopNow:(UIButton *)sender {
}

- (IBAction)settingS:(UIButton *)sender {
    UIAlertController *alerC = [UIAlertController alertControllerWithTitle:@"Please settings" message:@"\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alerC addAction:cancelAction];
    UILabel *label1 = [[UILabel alloc]init];
    [label1 setText:@"Units      >"];
    [alerC.view addSubview:label1];
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate =self;
    pickerView.dataSource = self;
    [alerC.view addSubview:pickerView];
    [pickerView selectRow:1 inComponent:0 animated:NO];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.mas_equalTo(alerC.view).with.offset(50);
        make.left.equalTo(alerC.view).with.offset(50);
    }];
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
         make.top.mas_equalTo(alerC.view).with.offset(50);
        make.left.equalTo(alerC.view).with.offset(160);
    }];
    UILabel *label2 = [[UILabel alloc]init];
    [label2 setText:@"Odmeter    >"];
    [alerC.view addSubview:label2];
    UITextField *textF = [[UITextField alloc]init];
    [alerC.view addSubview:textF];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.mas_equalTo(alerC.view).with.offset(100);
        make.left.equalTo(alerC.view).with.offset(50);
    }];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 20));
        make.bottom.mas_equalTo(pickerView).with.offset(10);
        make.left.equalTo(alerC.view).with.offset(160);
    }];
    textF.borderStyle = UITextBorderStyleLine;
    //添加确定到UIAlertController中
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@------%@",pickStr,textF.text);
        pickStr=nil;
        
    }];
    [alerC addAction:OKAction];
    [self presentViewController:alerC animated:YES completion:nil];
}
#pragma mark UIPickerView DataSource Method 数据源方法

//指定pickerview有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;//第一个展示字母、第二个展示数字
}

//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger result = 2;

    return result;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    pickStr = letter[row];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString * title = nil;
    title = letter[row];
    return title;
}
@end
