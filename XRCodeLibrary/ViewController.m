//
//  ViewController.m
//  XRCodeLibrary
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不计navigationbar的高度
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    dispatch_queue_t contsss = dispatch_queue_create("whatisit", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(contsss, ^{
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
        });
        
        
    });
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH,0), ^{
        
        /*
         *可并行执行的处理
         */
        
        /*
         *在Main Dispatch Queue中执行Block
         */
        dispatch_async(dispatch_get_main_queue(), ^{
            
            /*
             *只能在主线程中执行的处理
             */
            
        });
        
        
    });
    
    
  
 
    
}
#pragma mark -- 各种控件
-(void)kongJian{
    
    /*
     *活动指示器控件--loading转圈的那个
     */
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    indicator.color = [UIColor blueColor];
    //[self.view addSubview:indicator];
    [indicator startAnimating];
    [indicator stopAnimating];
    
    /*
     *进度条控件--UIProgressView
     */
    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(20, 100, 280, 30)];
    progressView.progressTintColor = [UIColor redColor];//已走过进度的颜色
    progressView.trackTintColor = [UIColor blueColor];//未走过进度的颜色
    [self.view addSubview:progressView];
    progressView.progress = 0.5;//进度条当前进度
    
    /*
     *步进控制器--UIStepper(加减号的控件)
     */
    UIStepper *stepper = [[UIStepper alloc]init];
    stepper.center = CGPointMake(100, 100);
    stepper.continuous = YES;
    stepper.autorepeat = YES;
    stepper.wraps = YES;
    stepper.minimumValue = 1;
    stepper.maximumValue = 10;
    stepper.stepValue = 1;
    stepper.tintColor = [UIColor redColor];
    [self.view addSubview:stepper];
    [stepper addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    
    /*
     *选择器控件--UIPickerView
     */
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectMake(20, 100, 270, 150)];
//    picker.delegate = self;
//    picker.dataSource = self;
    [self.view addSubview:picker];
    
   
    
    
}
-(void)click:(UIStepper *)step{
    NSLog(@"---%f",step.value);
}


#pragma mark 通过CALayer对视图进行修饰
-(void)CAlayer{
    //CALayer已经不输于UIKit框架中的内容，任何一个UIView的子类中，都包含一个CALayer的属性，Layer层是视图中专门用来渲染UI的一个层级，而View层出了UI的展现外，还封装了与用户交互的相关功能，并且View层的UI展现也是通过Layer层来渲染的，因此，iOS开发很多动画效果都是通过CALayer来实现的。
    
    /*
     *创建圆角控件
     */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 10;
    [self.view addSubview:btn];
    
    /*
     *创建带边框的控件
     */
    UIButton *btnn = [UIButton buttonWithType:UIButtonTypeCustom];
    btnn.frame = CGRectMake(100, 100, 100, 100);
    btnn.backgroundColor = [UIColor redColor];
    btnn.layer.borderColor = [UIColor greenColor].CGColor;
    btnn.layer.borderWidth = 5;
    [self.view addSubview:btnn];
    
    /*
     *添加阴影效果
     */
    UIButton *btnnn = [UIButton buttonWithType:UIButtonTypeCustom];
    btnnn.frame = CGRectMake(100, 100, 100, 100);
    btnnn.backgroundColor = [UIColor redColor];
    btnnn.layer.shadowColor = [UIColor grayColor].CGColor;
    btnnn.layer.shadowOffset = CGSizeMake(10, 10);
    btnnn.layer.shadowOpacity = 1;
    [self.view addSubview:btnnn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
