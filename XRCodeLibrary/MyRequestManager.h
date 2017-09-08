//
//  MyRequestManager.h
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyRequestManager : NSObject
+(MyRequestManager *)manager;

-(void)requestWithUrl:(NSString *)urlStr finished:(void(^)(BOOL,NSData*))finish;

@end
