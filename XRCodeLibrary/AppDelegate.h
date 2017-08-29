//
//  AppDelegate.h
//  XRCodeLibrary
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

