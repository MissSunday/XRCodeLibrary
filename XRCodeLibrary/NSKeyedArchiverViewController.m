//
//  NSKeyedArchiverViewController.m
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "NSKeyedArchiverViewController.h"
#import "AddressModel.h"

@interface NSKeyedArchiverViewController ()

@end

@implementation NSKeyedArchiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@",NSHomeDirectory());
    //沙盒文三个文件夹：Documents, Library, tmp。
    
    /*
     1.Documents: 用于保存应用运行时生成的需要持久化、非常大的或者需要频繁更新的数据，iTunes会自动备份该目录
    */
     //获取目录位置的代码如下
    NSArray *documentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //上面的documentDirectory是只有一个元素的数组，还需要以下代码取出路径
    NSString *myDocPath = [documentDirectory objectAtIndex:0];
    //或者 NSString *myDocPath = [documentDirectory lastObject];
    
    //后边拼接文件名
    NSString *filePath =[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"contacts.data"];
  
    /*
     2.Libaray: 用于存储程序的默认设置和其他状态信息，iTunes会自动备份该目录。Libaray/下主要有两个文件夹：Libaray/Caches和Libaray/Preferences。
     */
    //获取目录位置的代码如下：
    NSArray *libraryDirectory = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
    NSString * libraryDirectoryPath = [libraryDirectory lastObject];
    
   
    //Libaray/Caches：存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除，一般存放体积比较大，不是很重要的资源。
    //获取目录位置的代码如下：
    NSArray *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *cachesDirectoryPath = [cachesDirectory lastObject];
    
    
    //Libaray/Preferences:保存应用的所有偏好设置，ios的Settings（设置）应用会在该目录中查找应用的设置信息，iTunes会自动备份该目录。
    //获取目录位置的代码如下：
    NSArray * preferencesDirectory = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory,NSUserDomainMask,YES);
    NSString * preferencesDirectoryPath = [preferencesDirectory lastObject];

    /*
    tmp: 保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录删除，应用没有运行时，系统也可能会自动清理该目录下的文件，iTunes不会同步该目录，iPhone重启时该目录下的文件会丢失。
    */
    //获取目录位置的代码如下：
    NSString *tmp = NSTemporaryDirectory();
    
    
    /*
     *  二、存储方式
     
    常见的有四种存储方式：用NSUserDefaults存储配置信息
                      用NSKeyedArchive归档的形式来保存对象数据
                      文件沙盒存储
                      数据库存储           */
     //1. 用NSUserDefaults存储配置信息
        /*该方法被设计用来存储设备和应用的配置、属性、用户的信息，它通过一个工厂方法返回默认的实例对象。它实际上是存储于文件沙盒中的一个.plist文件，并且没有被系统加密，只是ios6以后不是存于常用的文档目录下，所以不破解系统是看不到。
         该文件的可以存储的数据类型包括：NSData、NSString、NSNumber、NSDate、NSArray、NSDictionary。如果要存储其他类型，则需要转换为前面的类型，才能用NSUserDefaults存储。
         */
    //用该方式 存 数据的代码如下 ：
    NSString *teleNum =  @"1868XX23763";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject: teleNum forKey:@"teleNum"];
    [userDefaults synchronize];
    //用该方式 取 数据的代码如下 ：
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *tlNum = [userDefault objectForKey:@"teleNum"];
    
    
    //2. 文件沙盒存储 主要存储非机密数据，大的数据，如图片。
    
    //存文件的操作步骤如下：
    
    //(1). 获得文件即将保存的路径
    //方法一：
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    NSString *ourDocumentPath =[documentPaths objectAtIndex:0];
    
    //方法二：
    NSString *sandboxPath = NSHomeDirectory();
    NSString *documentPath = [sandboxPath
                              stringByAppendingPathComponent:@"Documents"];
    
    //(2). 生成在该路径下的文件
    NSString *FileName=[ourDocumentPath stringByAppendingPathComponent:@"count.data"];//fileName就是保存文件的文件名
    
    //(3). 往文件中写入数据
    NSData *data = nil;
    [data writeToFile:@"count.data" atomically:YES];//将NSData类型对象data写入文件，文件名为FileName
    
    
    //从沙盒中取出文件：
    NSData *dat = [NSData dataWithContentsOfFile:@"count.data" options:0 error:NULL];//从FileName中读取出数据
    
    
    //3. 用NSKeyedArchive归档的形式来保存对象数据
    
    /*
     使用情景：在我们的实际开发过程中，为了更好的用户体验，可能需要在APP上存储用户的某些信息，比如淘宝APP会记录用户曾经填写过的收货地址。这种数据不方便用前面提到的NSUserDefaults来存储：一是，因为地址数据是一个模型，NSUserDefaults只能用于NSString、NSArray、NSDictionary等常用的数据类型；二是，用户还会经常对它进行增删改等操作，NSUserDefaults无法满足。
     此时，用NSKeyedArchive归档的形式来存储地址模型数据最符合要求。

     */
    
    
    
    
}
//保存图片与归档
- (void)save:(id)sender {
    
    //准备数据
    NSString *name = @"小杨在玩iOS";
    NSInteger age = 22;
    NSString *address = @"你猜我在哪~";
    UIImage *photo = [UIImage imageNamed:@"loginman.jpg"];
    //存储数据到类
    //Archive *archivingData = [[Archive alloc] init];
    //archivingData.name = name;
    //archivingData.age = age;
    //archivingData.address = address;
    //archivingData.photo = photo;
    
    AddressModel *model = [[AddressModel alloc]init];
    model.state = name;
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"file.data"];
    //归档
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:model forKey:@"key"]; // archivingDate的encodeWithCoder方法被调用
    [archiver finishEncoding];
    //写入文件
    [data writeToFile:filePath atomically:YES];
    
    
    
    
    NSData *dat = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    //获得类
    AddressModel *archivingData = [unarchiver decodeObjectForKey:@"key"];// initWithCoder方法被调用
    [unarchiver finishDecoding];
    //读取的数据
    NSString *nam = archivingData.state;
}

@end
