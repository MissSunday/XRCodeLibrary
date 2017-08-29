//
//  系统相机相册.m
//  XRCodeLibrary
//
//  Created by apple on 2017/7/19.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "系统相机相册.h"

@interface ______ ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation ______

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置头像";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavigation];
    [self addSubviews];
    [self makeConstraintsForUI];
    
}
#pragma mark - set navigation

- (void)setNavigation {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(selectPhoto:)];
}
#pragma mark - navitation item action

- (void)selectPhoto:(UIBarButtonItem *)itemCamera {
    
    //创建UIImagePickerController对象，并设置代理和可编辑
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.editing = YES;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    //创建sheet提示框，提示选择相机还是相册
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请选择打开方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //相机选项
    UIAlertAction * camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //选择相机时，设置UIImagePickerController对象相关属性
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
        //imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        //跳转到UIImagePickerController控制器弹出相机
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    
    //相册选项
    UIAlertAction * photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //选择相册时，设置UIImagePickerController对象相关属性
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //跳转到UIImagePickerController控制器弹出相册
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    
    //取消按钮
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    //添加各个按钮事件
    [alert addAction:camera];
    [alert addAction:photo];
    [alert addAction:cancel];
    
    //弹出sheet提示框
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - add subviews

- (void)addSubviews {
    
    [self.view addSubview:self.imageView];
}

#pragma mark - make constraints

- (void)makeConstraintsForUI {
    
    /* 对imageView适配
    __weak typeof(self)weakSelf = self;
   
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(weakSelf.view.bounds.size.width, weakSelf.view.bounds.size.width));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
    }];
     */
}

#pragma mark - imagePickerController delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    //获取到的图片
    UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
    _imageView.image = image;
}

#pragma mark - setter and getter

- (UIImageView *)imageView {
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor greenColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}







@end
