//
//  Person.h
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
//  姓名
@property(nonatomic, copy) NSString *name;
//  性别
@property(nonatomic, copy) NSString *sex;

@end
