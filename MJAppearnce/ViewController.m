//
//  ViewController.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "ViewController.h"

#import "MJAppearanceColor.h"
#import "MJAppearanceImage.h"

#import "NSObject+MJAppearance.h"
#import "UIView+MJAppearance.h"
#import "UIImageView+MJAppearance.h"
#import "UILabel+MJAppearance.h"
#import "UIButton+MJAppearance.h"

#import "UIView+Utils.h"


@interface ViewController ()

@property (nonatomic, strong) UISwitch *switchView;

@property (nonatomic, strong) UIView *normaleView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.switchView = [[UISwitch alloc]initWithFrame:CGRectMake(0, 100, 50, 50)];
    [self.switchView addTarget:self action:@selector(switchTheme) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.switchView];

    [self testBindColorToView];
    [self testBindImage];
}

- (void)testBindColorToView {
    //普通view
    self.normaleView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, 200, 50)];
    self.normaleView.mj_backgroundColor = MJAppearanceColor.Mojiblue;;
    [self.view addSubview:self.normaleView];

    //image
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 50 )];
    self.imageView.mj_backgroundColor = MJAppearanceColor.page;
    [self.view addSubview:self.imageView];
    self.imageView.top = self.normaleView.bottom;

    //label
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    self.label.text = @"我是文本";
    self.label.mj_textColor = MJAppearanceColor.Mojiblue;
    self.label.mj_backgroundColor = MJAppearanceColor.page;
    [self.view addSubview:self.label];
    self.label.top = self.imageView.bottom;

    //button
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 200, 50);
    [self.button setTitle:@"我是button" forState:UIControlStateNormal];
    [self.button mj_setTitleColor:MJAppearanceColor.Mojiblue forState:UIControlStateNormal];
    self.button.mj_backgroundColor = MJAppearanceColor.page;
    [self.view addSubview:self.button];
    self.button.top = self.label.bottom;
}

- (void)testBindImage {
    //image
    self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50 )];
    self.imageView2.mj_backgroundColor = MJAppearanceColor.page;
    self.imageView2.mj_image = [MJAppearanceImage mj_imageWithName:@"cry"];
    [self.view addSubview:self.imageView2];
    self.imageView2.top = self.button.bottom;
    
    //从assets读取
    self.imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50 )];
    self.imageView3.mj_backgroundColor = MJAppearanceColor.page;
    self.imageView3.mj_image = [MJAppearanceImage mj_imageWithName:@"smile"];
    [self.view addSubview:self.imageView3];
    self.imageView3.top = self.imageView2.bottom;
}

- (void)switchTheme {
    if(self.switchView.on){
        [[NSNotificationCenter defaultCenter] postNotificationName:KAppAppearanceChangeNotifcation object:@"1"];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:KAppAppearanceChangeNotifcation object:@"0"];
    }
}

@end
