//
//  LoginVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-3.
//
//

#import "LoginVC.h"
#import "MainVC.h"

@interface LoginVC ()

@end

@implementation LoginVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置TextFiled
    [self setTextField];
    
    //设置键盘事件
    [self setKeyboardNotification];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    //键盘消失
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, _accountTF.bounds.size.height)];
    leftView.backgroundColor = [UIColor clearColor];
    
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark 设置委托事件

- (void)setTextField
{
    _accountTF.delegate = self;
    _passwordTF.delegate = self;
    
    UIColor *color = [[UIColor alloc] initWithWhite:1 alpha:0.8];
    _accountTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  账户" attributes:@{NSForegroundColorAttributeName: color}];
    _passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  密码" attributes:@{NSForegroundColorAttributeName: color}];
}

- (void)setKeyboardNotification
{
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //设置键盘事件
    [center addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardShow:(NSNotification *)noti
{
    NSDictionary *dict = [noti userInfo];
    
    //获得最大的Y值
    CGFloat fieldMaxY = CGRectGetMaxY(_loginBtn.frame) + 20;
    
    
    //键盘的高度
    CGFloat keyH = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    [self keyShow:fieldMaxY keyH:keyH];
    
}

- (void)keyboardHide:(NSNotification *)noti
{
    NSDictionary *dict = [noti userInfo];
    CGFloat durtion = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:durtion animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
    
}

- (void)keyShow:(float)fieldMaxY keyH:(float)keyH
{
    CGFloat viewH = self.view.frame.size.height - keyH;
    
    
    [UIView animateWithDuration:0.25 animations:^{
        if (fieldMaxY > viewH)
        {
            self.view.transform = CGAffineTransformMakeTranslation(0, viewH-fieldMaxY-10);
        }
        else
        {
            self.view.transform = CGAffineTransformIdentity;
        }
    }];
    
}


- (IBAction)loginClicked
{
#warning 测试使用
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.view.window.rootViewController = [storyboard instantiateInitialViewController];
    
//    if ([self checkAccontAndPassword])
//    {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        self.view.window.rootViewController = [storyboard instantiateInitialViewController];
//    }
//    else
//    {
//        [self showMessage:@"请输入用户名或密码"];
//    }
}

//检查是否输入用户名和密码
- (BOOL)checkAccontAndPassword
{
    if (_accountTF.text.length > 0 && _passwordTF.text.length > 0) {
        return YES;
    }
    return NO;
}

- (void)showMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
