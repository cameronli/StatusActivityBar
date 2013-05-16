//
//  StatusActivityBar.m
//  StatusActivityBar
//
//  Created by Cameron on 13-5-16.
//  Copyright (c) 2013年 cm. All rights reserved.
//

#import "StatusActivityBar.h"
#import <QuartzCore/QuartzCore.h>

@implementation StatusActivityBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0.8;
        self.opaque = NO;
        self.clipsToBounds = YES;
        [self.layer setCornerRadius:4];
        [self.layer setBackgroundColor:[[UIColor blackColor] CGColor]];
        messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
        messageLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:messageLabel];
    }
    return self;
}

- (void)setMessage:(NSString *)message
{
    if (_message != message) {
        _message = nil;
        _message = [message retain];
    }
    messageLabel.text = _message;
}


+ (StatusActivityBar *)shareBar
{
    static StatusActivityBar *bar;
    if (bar == nil) {
        bar = [[StatusActivityBar alloc] initWithFrame:CGRectMake(10, -20, 300, 20)];
    }
    return bar;
}

+ (void)barShowInView:(UIView *)view withMessage:(NSString *)message
{
    
    [StatusActivityBar shareBar].message = message;
    
    [view addSubview:[StatusActivityBar shareBar]];
    [UIView beginAnimations:@"BarShow" context:nil];
    [UIView setAnimationDuration:1];
    [StatusActivityBar shareBar].frame = CGRectMake(10, 0, 300, 20);
    [UIView commitAnimations];
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:[StatusActivityBar shareBar] selector:@selector(hide) userInfo:nil repeats:NO];
}

- (void)hide
{
    [UIView beginAnimations:@"BarHide" context:nil];
    [UIView setAnimationDuration:1];
    [StatusActivityBar shareBar].frame = CGRectMake(10, -20, 300, 20);
    [UIView setAnimationDidStopSelector:@selector(removeView)];
    [UIView commitAnimations];
}

- (void)removeView
{
    [[StatusActivityBar shareBar] removeFromSuperview];
}


@end
