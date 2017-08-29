//
//  OrderModel.m
//  huayanzhibo
//
//  Created by 田聪 on 2017/4/10.
//  Copyright © 2017年 大神. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
     
        
    }
    return self;
}


- (void)setGoodsList:(NSArray *)goodsList {
    NSMutableArray *marray = [NSMutableArray array];
    for (NSDictionary *dic in goodsList) {
        weeOrderModel *weemodel = [[weeOrderModel alloc] init];
        weemodel.name = [dic objectForKey:@"name"];
        weemodel.picture = [dic objectForKey:@"picture"];
        weemodel.weight = [dic objectForKey:@"weight"];
        weemodel.weightPrice = [dic objectForKey:@"weightPrice"];
        [marray addObject:weemodel];
    }
    _goodsList = marray;

}

- (void)setCommoditysList:(NSArray *)commoditysList {
}

+ (OrderModel *)attentionWithDic:(NSDictionary *)dic {
    OrderModel *attention = [[OrderModel alloc] initWithDic:dic];
    return attention;
}


@end

@implementation weeOrderModel



@end
