//
//  KeyBoardViewController.m
//  XRCodeLibrary
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "KeyBoardViewController.h"

@interface KeyBoardViewController ()

@end

@implementation KeyBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在控制器中添加监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
//监听键盘动作,然后做出相应的动作
- (void)keyboardWillChange:(NSNotification *)note
{
    NSDictionary *userInfo = note.userInfo;
    CGFloat duration = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    CGRect keyFrame = [userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat moveY = keyFrame.origin.y - self.view.frame.size.height;
    //这个64是我减去的navigationbar加上状态栏20的高度,可以看自己的实际情况决定是否减去;
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, moveY);
    }];
    
}


@end
