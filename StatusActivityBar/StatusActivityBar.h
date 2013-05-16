//
//  StatusActivityBar.h
//  StatusActivityBar
//
//  Created by Cameron on 13-5-16.
//  Copyright (c) 2013年 cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusActivityBar : UIView
{
    UILabel *messageLabel;
}

@property (nonatomic, strong) NSString *message;

+ (StatusActivityBar *)shareBar;

+ (void)barShowInView:(UIView *)view withMessage:(NSString *)message;

@end
