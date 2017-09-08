//
//  MyRequestManager.m
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "MyRequestManager.h"

@implementation MyRequestManager

//重写init方法，在其中可进行一些对象的初始化
-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(MyRequestManager *)manager{
    
    //使用static创建的静态变量可以保证不被释放，dispatch_once()方法可以保证在程序执行过程中其内的代码只被执行一次，并且线程是安全的
    static MyRequestManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MyRequestManager alloc]init];
    });
    
    return manager;
    
}

-(void)requestWithUrl:(NSString *)urlStr finished:(void (^)(BOOL, NSData *))finish{
    
    //发送网路请求
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError == nil) {
            finish(YES,data);
        }else{
            
            finish(NO,data);
        }
        
        
    }];
    
    
    
}






@end
