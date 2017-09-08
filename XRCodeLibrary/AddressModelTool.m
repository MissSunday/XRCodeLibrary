//
//  AddressModelTool.m
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "AddressModelTool.h"
#import "AddressModel.h"
#define AddressInfosPath  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"addressInfo1.data"]

@implementation AddressModelTool

static NSMutableArray *_addressInfos;
+(NSArray *)allAddressInfo{
    
    //解档
    _addressInfos = [NSKeyedUnarchiver unarchiveObjectWithFile:AddressInfosPath];
    
    if (!_addressInfos) _addressInfos = [NSMutableArray array];
    return _addressInfos;
}


+(AddressModel *)currentSelectedAddress{
    AddressModel *currentAddress;
    BOOL hasSelectedAddress = NO;
    if ([self allAddressInfo].count) {
        for (AddressModel *info in _addressInfos) {
            if ([info.state isEqualToString:@"1"]) {
                currentAddress = info;
                hasSelectedAddress = YES;
                break;
            };
        }
    }else if([self allAddressInfo].count == 0 || hasSelectedAddress)
    {
        currentAddress = nil;
    }
    return currentAddress;
}


+(void)update{
    [NSKeyedArchiver archiveRootObject:_addressInfos toFile:AddressInfosPath];
}



+(void)updateAddressInfoAfterDeleted{
    if (_addressInfos.count) {
        if (![self currentSelectedAddress]) {
            AddressModel *info = [AddressModelTool allAddressInfo][0];
            info.state = @"1";
            [AddressModelTool updateInfoAtIndex:0 withInfo:info];
        }
    }
}


+(void)setSelectedAddressByNewInfoArray:(NSArray *)infoArray{
    //归档
    [NSKeyedArchiver archiveRootObject:infoArray toFile:AddressInfosPath];
}


+(void)addInfo:(AddressModel *)info{
    if (!_addressInfos.count) {
        _addressInfos = [NSMutableArray array];
    }
    for (AddressModel *oldInfo in _addressInfos ) {
        oldInfo.state = @"0";
    }
    [_addressInfos insertObject:info atIndex:0];
    [self update];
}


+ (void)removeInfoAtIndex:(NSUInteger)index {
    [_addressInfos removeObjectAtIndex:index];
    [self update];
}


+ (void)removeAllInfo{
    [_addressInfos removeAllObjects];
    [self update];
}


+ (void)updateInfoAtIndex:(NSUInteger)index withInfo:(AddressModel *)info {
    [_addressInfos replaceObjectAtIndex:index withObject:info];
    [self update];
}


@end
