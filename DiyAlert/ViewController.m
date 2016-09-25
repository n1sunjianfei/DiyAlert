//
//  ViewController.m
//  DiyAlert
//
//  Created by 孙建飞 on 16/4/28.
//  Copyright © 2016年 sjf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)yesAlert:(UIButton*)sender;
- (IBAction)noAlert:(UIButton *)sender;
- (IBAction)Warning:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _alert=[[Alert alloc]initAlertWithStyle:AlertStyleWarning];
   // _alert.alertStyle=AlertStyleWarning;
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)yesAlert:(id)sender {
    _alert.alertStyle=AlertStyleYes;
     [self.view addSubview:_alert];
}

- (IBAction)noAlert:(UIButton *)sender {
    _alert.alertStyle=AlertStyleNo;
 [self.view addSubview:_alert];
}

- (IBAction)Warning:(UIButton *)sender {
    _alert.alertStyle=AlertStyleWarning;
 [self.view addSubview:_alert];
}
@end
