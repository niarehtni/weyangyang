//
//  EditGroundVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import "EditGroundVC.h"
#import "UIViewController+PWCommonMethod.h"

@interface EditGroundVC ()

@end

@implementation EditGroundVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showBackButton];
    [self showRightButton:@"完成"];
}

- (void)rightBarButtonPressed:(UIBarButtonItem *)btnItem
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    _tipLabel.text = [NSString stringWithFormat:@"%zd/10",textField.text.length];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
