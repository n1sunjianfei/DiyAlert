//
//  Alert.h
//  DiyAlert
//
//  Created by 孙建飞 on 16/4/28.
//  Copyright © 2016年 sjf. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Wi [[UIScreen mainScreen]bounds].size.width

#define He [[UIScreen mainScreen]bounds].size.height


@interface Alert : UIView

typedef enum{
    AlertStyleYes=0,
    AlertStyleNo,
    AlertStyleWarning,
}AlertStyle;

@property(nonatomic,strong) UIView *alertView;

@property(nonatomic,strong) UIView *drawView;


@property(nonatomic) AlertStyle alertStyle;

@property(nonatomic,strong) UILabel *alertLabel;

@property(nonatomic,strong) UILabel *messageLabel;


@property(nonatomic,strong) UIButton *cancelButton;

@property(nonatomic,strong) UIButton *confirmButton;


-(instancetype)initAlertWithStyle:(AlertStyle)alertStyle;


@end
