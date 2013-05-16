//
//  ViewController.m
//  StatusActivityBar
//
//  Created by Cameron on 13-5-16.
//  Copyright (c) 2013年 cm. All rights reserved.
//

#import "ViewController.h"
#import "StatusActivityBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(50, 50, 50, 50);
        [btn setTitle:@"test" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
    
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 50, 30);
    
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)test:(UIButton *)btn
{
    
}

- (void)test
{
    [StatusActivityBar barShowInView:self.view withMessage:@"成功发送微博!!!"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
