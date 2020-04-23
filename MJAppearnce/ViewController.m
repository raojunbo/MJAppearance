//
//  ViewController.m
//  MJAppearnce
//
//  Created by rjb on 2020/4/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "ViewController.h"
#import "MJAppearance.h"
#import "UIView+Utils.h"
#import "UIImageView+WebCache.h"
#import "signal.h"

@interface ViewController ()

@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UIButton *toSecondButton;

@property (nonatomic, strong) UIView *normaleView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;


@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIImageView *imageView4;
@property (nonatomic, strong) UIImageView *imageView5;
@property (nonatomic, strong) UIImageView *imageView6;


@end

@implementation ViewController

- (void)dealloc
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.switchView = [[UISwitch alloc]initWithFrame:CGRectMake(0, 64, 50, 50)];
    [self.switchView addTarget:self action:@selector(switchTheme) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.switchView];
    
    self.toSecondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.toSecondButton.frame = CGRectMake(0, 0, 100, 50);
    self.toSecondButton.backgroundColor  = [UIColor redColor];
    [self.toSecondButton addTarget:self action:@selector(toSecondButtonButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.toSecondButton];
    self.toSecondButton.top = self.switchView.top;
    self.toSecondButton.left = self.switchView.right + 10;
    
    [self testBindColorToView];
    [self testBindLabel];
    [self testBindButton];
    [self testBindImageView];
}

- (void)toSecondButtonButtonClick {
    ViewController *secondVC = [[ViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)testBindColorToView {
    //普通view
    self.normaleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    self.normaleView.mj_backgroundColor = MJColor.Mojiblue;
    [self.view addSubview:self.normaleView];
    self.normaleView.top = self.switchView.bottom;
}

- (void)testBindLabel {
    //label
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    self.label.text = @"我是文本";
    self.label.mj_textColor = MJColor.Mojiblue;
    self.label.mj_backgroundColor = MJColor.page;
    [self.view addSubview:self.label];
    self.label.top = self.normaleView.bottom;
}

- (void)testBindButton {
    //button
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 50, 50);
    [self.button setTitle:@"我是button" forState:UIControlStateNormal];
    [self.button mj_setTitleColor:MJColor.Mojiblue forState:UIControlStateNormal];
    self.button.mj_backgroundColor = MJColor.page;
    [self.view addSubview:self.button];
    self.button.top = self.label.bottom;

    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2.frame = CGRectMake(0, 0, 50, 50);
    [self.button2 setTitle:@"我是button" forState:UIControlStateNormal];
    [self.button2 mj_setImage:[MJAppearanceImage mj_imageWithName:@"smile"] forState:UIControlStateNormal];
    [self.view addSubview:self.button2];
    self.button2.top = self.button.top;
    self.button2.left = self.button.right + 10;

    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button3.frame = CGRectMake(0, 0, 50, 50);
    [self.button3 setTitle:@"我是button" forState:UIControlStateNormal];
    [self.button3 mj_setBackgroundImage:[MJAppearanceImage mj_imageWithName:@"smile"] forState:UIControlStateNormal];
    [self.view addSubview:self.button3];
    self.button3.top = self.button.top;
    self.button3.left = self.button2.right + 10;
}

- (void)testBindImageView {
    //image
    self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50 )];
    self.imageView2.mj_backgroundColor = MJColor.page;
    self.imageView2.mj_image = [MJAppearanceImage mj_imageWithName:@"cry"];
    [self.view addSubview:self.imageView2];
    self.imageView2.top = self.button.bottom;

    //从assets读取
    self.imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50 )];
    self.imageView3.mj_backgroundColor = MJColor.page;
    self.imageView3.mj_image = [MJAppearanceImage mj_imageWithName:@"cry"];
    [self.view addSubview:self.imageView3];
    self.imageView3.top = self.imageView2.top;
    self.imageView3.left = self.imageView2.right + 10;

    //文件读取
    self.imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50 )];

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resourcePath = [bundle resourcePath];
    NSString *filePath = [resourcePath stringByAppendingPathComponent:@"cry"];
    self.imageView4.mj_image =  [MJAppearanceImage mj_imageWithContentsOfFile:filePath];
    [self.view addSubview:self.imageView4];
    self.imageView4.top = self.imageView2.top;
    self.imageView4.left = self.imageView3.right + 10;

    //直接创建ImageView
    UIImage *cryImage = [MJAppearanceImage mj_imageWithName:@"cry"];
    self.imageView5 = [[UIImageView alloc]mj_initWithImage:cryImage];
    self.imageView5.frame = CGRectMake(0, 0, 50, 50);
    [self.view addSubview:self.imageView5];
    self.imageView5.top = self.imageView2.top;
    self.imageView5.left = self.imageView4.right + 10;

    //网络图片
    self.imageView6 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.imageView6.layer.masksToBounds = YES;
    self.imageView6.layer.cornerRadius = 20;
    [self.imageView6 sd_setImageWithURL:[NSURL URLWithString:@"https://www.google.com/logos/doodles/2020/thank-you-teachers-and-childcare-workers-6753651837108762.3-law.gif"]];
    self.imageView6.mj_backgroundColor = MJColor.Mojiblue;
    [self.view addSubview:self.imageView6];
    self.imageView6.top = self.imageView2.top;
    self.imageView6.left = self.imageView5.right + 10;
    self.imageView6.mj_netImageSupportDark = YES;

    self.navigationController.navigationBar.mj_barTintColor = MJColor.red;
}

- (void)switchTheme {
    if(self.switchView.on){
        [MJAppearanceManager sharedInstance].currentMode = MJAppearanceModeLight;
    }else{
        [MJAppearanceManager sharedInstance].currentMode = MJAppearanceModeDark;
    }
}


@end
