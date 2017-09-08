//
//  UserDefaultViewController.m
//  XRCodeLibrary
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "UserDefaultViewController.h"
#import "Person.h"
@interface UserDefaultViewController ()
{
    UIWebView *_webView;
    NSMutableArray *_dataArray;
}
@end

@implementation UserDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     NSUserDefaults是一个单例，由系统原生自带，使用方法简单，可以让数据本地化，自由传递。
     NSUserDefaults可以直接存储的数据类型有：NSString，NSNumber，NSDate，NSArray，NSDictionary，BOOL
     */
    //  存储 NSString 对象到 NSUserDefaults 中
    NSString *userName = @"Heracles";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userName forKey:@"userName"];
    
    //  从 NSUserDefaults 中取出 NSString 只要取出对应的 Key 值就可以了
    NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
    NSString *Name = [Defaults objectForKey:@"userName"];
    
    
    //操作方法
    //如果本地没有，那么新建一个
    NSArray *array = [[NSUserDefaults standardUserDefaults]valueForKey:@"Like"];
    if (!array) {
        array = [NSArray array];
        
    }
    NSMutableArray *newArray = [[NSMutableArray alloc]initWithArray:array];
    [newArray addObject:_webView.request.URL.absoluteString];
    [[NSUserDefaults standardUserDefaults]setValue:newArray forKey:@"Like"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //取出来直接转化成数组
    _dataArray = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"Like"]];
    
    /*********************************************************************************/
    //NSUserDefaults存储自定义的对象能需要将对象归档成NSData类型，然后储存，不然程序会报错。
    
    //  初始化对象
    Person *person = [[Person alloc] init];
    //  对 person 赋值
    person.name = @"孙悟空";
    person.sex = @"男";
    //  归档
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject: person];
    //  存储
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:person forKey:@"person"];
    
    //  读取数据
    NSUserDefaults * userdefault = [NSUserDefaults standardUserDefaults];
    
    NSData *readData = [userdefault objectForKey:@"person"];
    //  反归档
    Person *readPerson = [NSKeyedUnarchiver unarchiveObjectWithData:readData];
    
    NSLog(@"--%@--%@--",readPerson.name,readPerson.sex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
