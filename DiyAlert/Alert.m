//
//  Alert.m
//  DiyAlert
//
//  Created by 孙建飞 on 16/4/28.
//  Copyright © 2016年 sjf. All rights reserved.
//

#import "Alert.h"

@implementation Alert


-(instancetype)initAlertWithStyle:(AlertStyle)alertStyle{
    CGRect frame=  CGRectMake(0, 0, Wi, He);
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor colorWithRed:0.1 green:0.2 blue:0.3 alpha:0.3];
        //
       // self.center=CGPointMake(Wi/2, He/2);
        //
        [self initViews];
        
        //
        if (alertStyle==AlertStyleNo) {
            [self drawNo];
        }
        if (alertStyle==AlertStyleYes) {
            [self drawYes];

       }
        if (alertStyle==AlertStyleWarning) {
            [self drawWarning];

       }
     
        
    }
    return self;
}

/*
 初始化视图
*/
-(void)initViews{
    //
    self.alertView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 190)];
    self.alertView.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:1.5 alpha:0.9];
    self.alertView.layer.masksToBounds=YES;
    self.alertView.layer.cornerRadius=5;
    self.alertView.center=self.center;
    [self addSubview:self.alertView];
    //
    self.drawView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 110)];
  //  self.drawView.backgroundColor=[UIColor blackColor];
    [self.alertView addSubview:self.drawView];
    //
    self.alertLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 95, self.drawView.frame.size.width, 30)];
    self.alertLabel.textAlignment=1;
    _alertLabel.text=@"alertLabel";
    [self.alertView bringSubviewToFront:_alertLabel];
    [self.alertView addSubview:_alertLabel];
    //
    self.messageLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 120, self.drawView.frame.size.width, 30)];
    self.messageLabel.textAlignment=1;
    _messageLabel.text=@"messageLabel";
    [self.alertView bringSubviewToFront:_messageLabel];
    [self.alertView addSubview:_messageLabel];
    //
    _cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelButton setFrame:CGRectMake(10, 150, 60, 30)];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _cancelButton.backgroundColor=[UIColor colorWithRed:0.1 green:0.2 blue:0.5 alpha:0.8];
    _cancelButton.layer.masksToBounds=YES;
    _cancelButton.layer.cornerRadius=5;
    [self.alertView addSubview:_cancelButton];
    //
    _confirmButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_confirmButton setFrame:CGRectMake(90, 150, 60, 30)];
    [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [_confirmButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _confirmButton.backgroundColor=[UIColor colorWithRed:0.6 green:0.3 blue:0.2 alpha:0.8];
    _confirmButton.layer.masksToBounds=YES;
    _confirmButton.layer.cornerRadius=5;
    [self.alertView addSubview:_confirmButton];
    
}
-(void)back{
    [self removeFromSuperview];
}
/*
 设置alertStyle
*/
-(void)setAlertStyle:(AlertStyle)alertStyle{

    
    _alertStyle=alertStyle ;
    [self addSubview:self.alertView];
    if (alertStyle==AlertStyleNo) {
        [self drawNo];
    }
    if (alertStyle==AlertStyleYes) {
        [self drawYes];
        
    }
    if (alertStyle==AlertStyleWarning) {
        [self drawWarning];
        
    }

}
/**************************三个绘制*****************************/

/*
 绘制yes
*/
-(void)drawYes{
    //先移除再绘制
    [self.drawView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer) ];
    _alertLabel.text=@"Yes";
    _alertLabel.textColor=[UIColor blueColor];
    //
    _messageLabel.text=@"登陆成功";
    _messageLabel.textColor=[UIColor grayColor];
    //
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(120, 50)];
    [path addArcWithCenter:CGPointMake(80, 50) radius:40 startAngle:2*M_PI endAngle: 0 clockwise:0];
    [path moveToPoint:CGPointMake(60,50)];
    [path addLineToPoint:CGPointMake(80, 70)];
    [path addLineToPoint:CGPointMake(110, 30)];
    
    // NSLog(@"%f",M_PI);
    //
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blueColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 4.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    
    [self.drawView.layer addSublayer:pathLayer];
    //
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration =0.5;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];

}
/*
 绘制No
*/
-(void)drawNo{
    //先移除再绘制
    [self.drawView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer) ];
    //
    _alertLabel.text=@"登陆失败";
    _alertLabel.textColor=[UIColor redColor];
    //
    _messageLabel.text=@"密码输入错误";
    _messageLabel.textColor=[UIColor grayColor];
    //
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(40, 10)];
    [path addLineToPoint:CGPointMake(40, 90)];
    [path addLineToPoint:CGPointMake(120, 90)];
    [path addLineToPoint:CGPointMake(120, 10)];
    [path addLineToPoint:CGPointMake(40, 10)];
    
    [path moveToPoint:CGPointMake(60, 30)];
    [path addLineToPoint:CGPointMake(100, 70)];
    
    [path moveToPoint:CGPointMake(100, 30)];
    [path addLineToPoint:CGPointMake(60, 70)];
    //
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor redColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 4.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    [self.drawView.layer addSublayer:pathLayer];

    //
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];

    
}
/*
 绘制Warning
 */
-(void)drawWarning{
    //先移除再绘制
    [self.drawView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer) ];
    //
    _alertLabel.text=@"警告";
    _alertLabel.textColor=[UIColor colorWithRed:1.4 green:1.0 blue:0 alpha:1.0];
    //
    _messageLabel.text=@"内存不足";
    _messageLabel.textColor=[UIColor grayColor];
    //
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(80, 10)];
    [path addLineToPoint:CGPointMake(30, 95)];
    [path addLineToPoint:CGPointMake(130, 95)];
    [path addLineToPoint:CGPointMake(80, 10)];
    
    [path moveToPoint:CGPointMake(80, 30)];
    [path addLineToPoint:CGPointMake(80, 75)];
    
    [path moveToPoint:CGPointMake(80, 80)];
    [path addLineToPoint:CGPointMake(80, 85)];
    //
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor yellowColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 4.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.drawView.layer addSublayer:pathLayer];
    
    //
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
}

/*
//
 UIBezierPath *path = [UIBezierPath bezierPath]; 
 [path moveToPoint:CGPointMake(0.0,20.0)]; 
 [path addLineToPoint:CGPointMake(120.0, 500.0)]; 
 [path addLineToPoint:CGPointMake(220, 0)]; 
 [path addLineToPoint:CGPointMake(310, 40)]; 
 [path addLineToPoint:CGPointMake(SCREEN_WIDTH, 110)];
 //
 CAShapeLayer *pathLayer = [CAShapeLayer layer];
 pathLayer.frame = self.view.bounds;
 pathLayer.path = path.CGPath;
 pathLayer.strokeColor = [[UIColor redColor] CGColor];
 pathLayer.fillColor = nil;
 pathLayer.lineWidth = 2.0f;
 pathLayer.lineJoin = kCALineJoinBevel;
 [self.view.layer addSublayer:pathLayer];
 //
 CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
 pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
 pathAnimation.duration = 2.0;
 pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
 pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
 [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
*/

@end
