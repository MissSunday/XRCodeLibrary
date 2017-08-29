//
//  TCYDiGeModel.m
//  huayanzhibo
//
//  Created by 渣渣 on 16/10/7.
//  Copyright © 2016年 大神. All rights reserved.
//

#import "TCYDiGeModel.h"

@implementation TCYDiGeModel

- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.uid = value;
    }
    if ([key isEqualToString:@"nickName"]) {
        self.nickname = value;
    }
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}

+ (TCYDiGeModel *)attentionWithDic:(NSDictionary *)dic {
    TCYDiGeModel *attention = [[TCYDiGeModel alloc] initWithDic:dic];
    return attention;
}



@end
