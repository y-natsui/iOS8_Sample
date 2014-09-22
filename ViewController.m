//
//  ViewController.m
//  iOS8_Sample
//
//  Created by Yoshihiro Natsui on 9/19/14.
//  Copyright (c) 2014 Yoshihiro Natsui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//ボタン
@property (nonatomic, strong) IBOutlet UIButton *alertBtn;
@property (nonatomic, strong) IBOutlet UIButton *actionSheetBtn;
@property (nonatomic, strong) IBOutlet UIButton *imgPickerBtn;

//View
@property (nonatomic, strong) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)alertBtnTapped:(id)sender{
    //アラートを表示
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:@"アラートです！"
                                        message:@"iOS8対応です"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //addActionした順に左から右にボタンが配置されます
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"はい"
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action){
        //otherボタンが押された時の処理
        [self otherButtonPushed];
    }]];
    
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"いいえ"
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action){
        //cancelボタンが押された時の処理
        [self cancelButtonPushed];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

-(IBAction)actionSheetBtnPushed:(id)sender{
    //アクションシートを表示
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:@"ActionSheetです！"
                                        message:@"iOS8対応です"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"はい"
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action){
        //otherボタンが押された時の処理
        [self otherButtonPushed];
    }]];
    
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"いいえ"
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action){
        //cancelボタンが押された時の処理
        [self cancelButtonPushed];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(IBAction)imgPickerBtnPushed:(id)sender{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

//select image
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imgView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//cancel
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//アラート＆アクションシート用メソッド
-(void)cancelButtonPushed{}
-(void)otherButtonPushed{}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
