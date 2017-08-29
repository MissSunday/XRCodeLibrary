//
//  XRLabel.m
//  WebSocketTest
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "XRLabel.h"

@implementation XRLabel

/*此方式会出现闪烁,暂时未解决*/

//可以成为第一响应者
-(BOOL)canBecomeFirstResponder{
    
    return YES;
    
}
//可以响应的方法
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    
    return (action == @selector(customCopy:));
    
    
}
//实现方法
-(void)customCopy:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;

}
//UILabel默认是不接收事件的,需要我们自己添加touch事件
-(void)attachTapHadler{
    
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longTouch = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:longTouch];
    
    
    
}
//实现touch响应的事件
-(void)handleTap:(UIGestureRecognizer *)recongizer{
    
    
    [self becomeFirstResponder];
    UIMenuItem *copyLink = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(customCopy:)];
    [[UIMenuController sharedMenuController]setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    [[UIMenuController sharedMenuController]setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController]setMenuVisible:YES animated:YES];
    
    
}

//初始化方法
-(id)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self attachTapHadler];
        
    }
    return self;
    
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self attachTapHadler];
    
}

@end
