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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
