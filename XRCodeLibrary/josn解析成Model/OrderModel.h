//
//  OrderModel.h
//  huayanzhibo
//
//  Created by 田聪 on 2017/4/10.
//  Copyright © 2017年 大神. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject
@property (nonatomic,strong)NSArray *goodsList;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,strong)NSNumber *number;
@property (nonatomic,strong)NSNumber *oid;
@property (nonatomic,copy)NSString *price;
@property (nonatomic,strong)NSNumber *orderStatus;
@property (nonatomic,strong)NSNumber *paymentStatus;
@property (nonatomic,copy)NSString *time;
+ (OrderModel *)attentionWithDic:(NSDictionary *)dic;

@end

@interface weeOrderModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,strong)NSNumber *picture;
@property (nonatomic,copy)NSString *weight;
@property (nonatomic,copy)NSString *weightPrice;
@end
