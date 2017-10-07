//
//  XR_UIView_contentMode.m
//  XRCodeLibrary
//
//  Created by apple on 2017/9/26.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "XR_UIView_contentMode.h"

@interface XR_UIView_contentMode ()

@end

@implementation XR_UIView_contentMode

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    UIView contentMode
    
        Content Modes
    
        contentMode是UIView的属性，这个属性的值决定了，当视图的几何形状变化时如何复用它的内容。当视图第一次展示前，它会将自己的内容渲染成一张底层的bitmap. 然后视图的几何变化都不会使bitmap重新生成。而视图contentMode属性的值决定了bitmap是否缩放、位置在哪儿（固定在左边、右边、上面、下面、居中）。默认情况下，contentMode的值是
    
        contentMode啥时候起作用呢？
    
        视图frame或bounds的高宽发生变化
        赋给 view的transform属性的值带有scale
        UIViewContentModeScaleToFill
    
        Scales the content to fit the size of itself by changing the aspect ratio of the content if necessary.
        
        改变内容的高宽比例，缩放内容，UIView中完整显示内容，填满UIView，
        
        UIViewContentModeScaleAspectFit
        
        Scales the content to fit the size of the view by maintaining the aspect ratio. Any remaining area of the view’s bounds is transparent.
        
        保持内容的高宽比，缩放内容，完整显示内容，最大化填充UIview，没填充上的区域透明
        
        UIViewContentModeScaleAspectFill
        
        Scales the content to fill the size of the view. Some portion of the content may be clipped to fill the view’s bounds.
        
        保持内容高宽比，缩放内容，超出视图的部分内容会被裁减，填充UIView
        
        UIViewContentModeRedraw
        
        The option to redisplay the view when the bounds change by invoking the setNeedsDisplay method.
        
        当View的bounds改变，系统会调用setNeedsDisplay，重新绘制视图
        
        UIViewContentModeCenter
        
        The option to center the content in the view’s bounds, keeping the proportions the same.
        
        不缩放，内容在视图中间
        */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
