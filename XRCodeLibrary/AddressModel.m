//
//  AddressModel.m
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "AddressModel.h"

@implementation AddressModel
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_state forKey:@"state"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_phoneNum forKey:@"phoneNum"];
    [aCoder encodeObject:_mainAddress forKey:@"mainAddress"];
    [aCoder encodeObject:_detailAddress forKey:@"detailAddress"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.state= [aDecoder decodeObjectForKey:@"state"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.phoneNum = [aDecoder decodeObjectForKey:@"phoneNum"];
        self.mainAddress = [aDecoder decodeObjectForKey:@"mainAddress"];
        self.detailAddress = [aDecoder decodeObjectForKey:@"detailAddress"];
    }else{
        return nil;
    }
    return self;
}



+(instancetype)AddressModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initAddressModelWithDict:dict];
}

-(instancetype)initAddressModelWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.state =[dict objectForKey:@"state"];
        self.name =[dict objectForKey:@"name"];
        self.phoneNum =[dict objectForKey:@"phoneNum"];
        self.mainAddress =[dict objectForKey:@"mainAddress"];
        self.detailAddress =[dict objectForKey:@"detailAddress"];
    }
    return self;
}

@end
