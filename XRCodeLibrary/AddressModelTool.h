//
//  AddressModelTool.h
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AddressModel;
@interface AddressModelTool : NSObject

+(NSArray *)allAddressInfo;
+(AddressModel *)currentSelectedAddress;
+(void)update;
+(void)updateAddressInfoAfterDeleted;

+(void)setSelectedAddressByNewInfoArray:(NSArray *)infoArray;
+(void)addInfo:(AddressModel *)info;
+(void)removeInfoAtIndex:(NSUInteger)index;
+(void)updateInfoAtIndex:(NSUInteger)index withInfo:(AddressModel *)info;
+(void)removeAllInfo;



@end
