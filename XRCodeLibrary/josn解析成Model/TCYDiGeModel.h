//
//  TCYDiGeModel.h
//  huayanzhibo
//
//  Created by 渣渣 on 16/10/7.
//  Copyright © 2016年 大神. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCYDiGeModel : NSObject

//主播model

@property (nonatomic,copy)NSString *cid;
@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSNumber *head;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,copy)NSNumber *number;
@property (nonatomic,copy)NSString *roomKey;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSNumber *status;
@property (nonatomic,copy)NSNumber *uid;
@property (nonatomic,copy)NSString *profit;//弃用
@property (nonatomic,copy)NSString *diamond;//亲密度
@property (nonatomic,copy)NSString *password;//密码
@property (nonatomic,copy)NSString *praise;
@property (nonatomic,copy)NSNumber *roomid;//聊天室id
@property (nonatomic,copy)NSString *role;
@property (nonatomic,copy)NSNumber *level;
@property (nonatomic,copy)NSString *colour;
@property (nonatomic,copy)NSString *signature;//签名
@property (nonatomic,copy)NSNumber *online;//是否在线
@property (nonatomic,copy)NSNumber *auStatus;//是否是商家
+ (TCYDiGeModel *)attentionWithDic:(NSDictionary *)dic;


@end
