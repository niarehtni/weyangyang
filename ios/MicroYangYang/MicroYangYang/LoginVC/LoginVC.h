//
//  LoginVC.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)loginClicked;

@end
