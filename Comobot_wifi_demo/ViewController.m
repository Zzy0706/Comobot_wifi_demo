//
//  ViewController.m
//  Comobot_wifi_demo
//
//  Created by zzy on 17/6/20.
//  Copyright © 2017年 com.comobd.io. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "GCDAsyncSocket.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>
#define SOCKET_CMD_INIT    @"010\r\n"
#define SOCKET_CMD_KEEP    @"ping\r\n"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,GCDAsyncSocketDelegate>{
    BOOL userYou;
    BOOL flameout;
    NSString *timStr;
    NSUserDefaults *user;
    NSString *getTime;
    NSString *getMiles;
    NSArray * letter;
    NSString *pickStr;
    UITextField *textF;
    UITextField *textF1;
    UITextField *textF2;
    UITextField *textF3;
    UITextField *textF4;
    UITextField *textF5;
    UITextField *textF6;
    UITextField *textF7;
    UITextView *textF8;
    UITextView *textF9;
    UITextView *textF10;
}

@end

@implementation ViewController
-(void)viewDidLayoutSubviews
{
    self.myScrollView.contentSize = CGSizeMake(300,1080);
}



-(void)threadStart{
    @autoreleasepool {
        [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(heartBeat) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]run];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    userYou = true;
    user = [NSUserDefaults standardUserDefaults];
    [self getUserData];
    [self.myScrollView setBackgroundColor:[UIColor blackColor]];
    [self creatText];
    NSLog(@"%@",[[self getCurrentWifiIP] substringToIndex:11]);
    letter = @[@"km",@"m"];
}
#pragma mark 获取WIFI IP
-(NSString*)getCurrentWifiIP
{
    NSString *address = nil;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    if (success == 0) {
      
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
     
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                   
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}





-(void)creatText{
     CGRect r = [ UIScreen mainScreen ].bounds;
     textF1 = [[UITextField alloc]init];
     textF2 = [[UITextField alloc]init];
     textF3 = [[UITextField alloc]init];
     textF4 = [[UITextField alloc]init];
     textF5 = [[UITextField alloc]init];
     textF6 = [[UITextField alloc]init];
     textF7 = [[UITextField alloc]init];
     textF8 = [[UITextView alloc]init];
     textF9 = [[UITextView alloc]init];
     textF10 = [[UITextView alloc]init];
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
    [textF1 setText:@"Engine powe status >"];
    [textF2 setText:@"Miles driven > 0.7(km) 0.4(mile)"];
    [textF3 setText:@"Engine hours > 0.7(min) "];
    [textF4 setText:@"Total engine hours > "];
    [textF5 setText:@"Engine RPM > "];
    [textF6 setText:@"Odometer > "];
    [textF7 setText:@"GPS data > "];
    [textF8 setText:@"OBD data >\n  "];
    [textF9 setText:@"Fault code >\n "];
    [textF10 setText:@"Mileage>\n "];
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textF resignFirstResponder];
    return true;
}
- (IBAction)startNow:(UIButton *)sender {


    NSLog(@"-------%@",[[self getCurrentWifiIP] substringToIndex:11]);
    self.clinetSocket= [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)];
    if ([[[self getCurrentWifiIP] substringToIndex:10] isEqualToString:@"192.168.43"]) {
         [self.clinetSocket connectToHost:@"192.168.43.1" onPort:9900 withTimeout:-1 error:nil];
    }else{
        NSLog(@"未连接程序热点！！！");
    }
   
}
-(void)heartBeat{
    [self.clinetSocket writeData:[self Data:SOCKET_CMD_KEEP] withTimeout:-1 tag:127];
}
//将字符转换为数据
-(NSData *)Data:(NSString *)str{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}
- (void)socket:(GCDAsyncSocket*)sock didConnectToHost:(NSString*)host port:(uint16_t)port{
    NSLog(@"成功");
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadStart) object:nil];
    [thread start];
    [self.clinetSocket writeData:[self Data:SOCKET_CMD_INIT] withTimeout:-1 tag:10];
    [self.clinetSocket readDataWithTimeout:-1 tag:10];
}
- (void)socket:(GCDAsyncSocket*)sock didReadData:(NSData*)data withTag:(long)tag{
    NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",text);
    NSArray *arr =[text componentsSeparatedByString:@"|"];
    NSString *str1 = arr[0];
    if (arr.count == 2) {
        if ([str1 containsString:@"@1"]) {
            if ([arr[1] containsString:@"FLAMEOUT"]) {
                [user setObject:timStr forKey:@"FLAMEOUT2"];
                flameout = true;
            }
            
        }else if([str1 containsString:@"@2"]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [textF9 setText:[NSString stringWithFormat:@"Fault code >\n %@",arr[1]]];
            });
        }else if([str1 containsString:@"@3"]){
            [self getUserData];
            NSDictionary *dict = [self DictionFjson:arr[1]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [textF8 setText:[NSString stringWithFormat:@"OBD data >\n %@ ",arr[1]]];
            });
            [self showDataNow:dict];
        }else if([str1 containsString:@"@4"]){
            NSDictionary *dict = [self DictionFjson:arr[1]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [user setObject:dict forKey:@"FLAMEOUT"];
                });
            
        }
    }
    
     [self.clinetSocket readDataWithTimeout:-1 tag:10];
}
-(NSDictionary *)DictionFjson:(NSString *)jsonStr{
    if (jsonStr == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;
}
- (IBAction)stopNow:(UIButton *)sender {
    [self.clinetSocket disconnect];
    
}
-(void)showDataNow:(NSDictionary *)dict{
    dispatch_async(dispatch_get_main_queue(), ^{
        int time =[dict[@"TIMES"] floatValue];
        if (getTime == nil) {
            getTime = @"0";
        }
        float tTime = time/3600+[getTime floatValue];
        float kmT = [dict[@"MILES-T"] floatValue];
        float tkmT =kmT/1000 +[getMiles floatValue];
        timStr = [NSString stringWithFormat:@"%f",tkmT];
        
        

        [textF1 setText:[NSString stringWithFormat:@"Engine powe status > Engine powe On"]];
        [textF2 setText:[NSString stringWithFormat:@"Miles driven > %.01f(km) %.01f(mile)",kmT/1000,kmT*0.000621]];
        [textF3 setText:[NSString stringWithFormat:@"Engine hours > %d(min) ",time/60]];
        [textF4 setText:[NSString stringWithFormat:@"Total engine hours > %0.1f(H)",tTime]];
        [textF5 setText:[NSString stringWithFormat:@"Engine RPM > %@",dict[@"RPM"]]];
        [textF6 setText:[NSString stringWithFormat:@"Odometer > %.1f(km) %.01f(mile)",tkmT,tkmT*0.621]];
        [textF7 setText:[NSString stringWithFormat:@"GPS data > "]];
        [textF10 setText:[NSString stringWithFormat:@"Mileage>\n "]];

    });
}
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(nullable NSError *)err;{
    if (err) {
        NSLog(@"出错了！！！！出错了！！！:%@",err);
    }else{
        NSLog(@"断开咯~~~~~~~");
    }
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
    textF = [[UITextField alloc]init];
    textF.delegate = self;
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
        userYou = false;
        NSLog(@"%@------%@",pickStr,textF.text);
        pickStr=nil;
        if (!flameout) {
            [user setObject:textF.text forKey:@"false"];
        }else{
            [user setObject:textF.text forKey:@"FLAMEOUT2"];
        }
    dispatch_async(dispatch_get_main_queue(), ^{
             [textF6 setText:[NSString stringWithFormat:@"Odometer > %.1f(km) %.01f(mile)",[textF.text floatValue],[textF.text floatValue]*0.621]];
        });
        
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
-(void)getUserData{
    NSDictionary *dic = [user objectForKey:@"FLAMEOUT"];
    getTime = dic[@"TIMES"];
    if (userYou) {
        getMiles = dic[@"MILES"];
    }else if (flameout){
        getMiles =[user objectForKey:@"FLAMEOUT2"];
        
    }else{
        getMiles =[user objectForKey:@"false"];

    }
  

}
@end
