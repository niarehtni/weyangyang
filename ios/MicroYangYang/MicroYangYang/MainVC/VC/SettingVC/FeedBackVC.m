//
//  FeedBackVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import "FeedBackVC.h"
#import "UIViewController+PWCommonMethod.h"


@interface FeedBackVC ()
{
    //键盘的高度
    CGFloat keyH;
}
@end

@implementation FeedBackVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showBackButton];
    
    //设置键盘事件
    [self setKeyboardNotification];
    
    [self showRinghtBtn];
    
    [self addGestrue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showRinghtBtn
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 30);
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)send
{
    
}

- (void)addGestrue
{
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] init];
    [swip addTarget:self action:@selector(swip:)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:swip];
    [_contentTV addGestureRecognizer:swip];
    [_emailTF addGestureRecognizer:swip];
}

- (void)swip:(UISwipeGestureRecognizer *)swip
{
    [self.view endEditing:YES];
}

#pragma mark - 键盘事件

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
    
    
    //键盘的高度
    keyH = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;

}

- (void)keyboardHide:(NSNotification *)noti
{
    NSDictionary *dict = [noti userInfo];
    CGFloat durtion = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:durtion animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
    
}

- (void)keyShow:(float)fieldMaxY keyH:(float)keyBoardH
{
    CGFloat viewH = self.view.frame.size.height - keyBoardH;
    
    
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

#pragma mark - UITextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:_emailTF])
    {
        //获得最大的Y值
        CGFloat fieldMaxY = CGRectGetMaxY(_emailTF.frame) + 130;
        
        [self keyShow:fieldMaxY keyH:keyH];
    }
    else
    {
        //获得最大的Y值
        CGFloat fieldMaxY = CGRectGetMaxY(_emailTF.frame);
        
        [self keyShow:fieldMaxY keyH:keyH];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

#pragma UITextView delegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _tipLabel.text = nil;
    //获得最大的Y值
    CGFloat fieldMaxY = CGRectGetMaxY(_contentTV.frame);
    
    [self keyShow:fieldMaxY keyH:keyH];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        _tipLabel.text = @"说点什么...";
    }
    else
    {
        _tipLabel.text = nil;
    }
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length == 0) {
        _tipLabel.text = @"说点什么...";
    }
    else
    {
        _tipLabel.text = nil;
    }
}

@end
