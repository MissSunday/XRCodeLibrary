//
//  AddressModel.h
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressModel : NSObject<NSCoding>
//用于存储多个地址时，标记用户选中的状态
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNum;
@property (nonatomic ,copy) NSString *mainAddress;
@property (nonatomic ,copy) NSString *detailAddress;

+(instancetype)AddressModelWithDict:(NSDictionary *)dict;
-(instancetype)initAddressModelWithDict:(NSDictionary *)dict;

@end
