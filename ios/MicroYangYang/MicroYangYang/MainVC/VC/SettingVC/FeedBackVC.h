//
//  FeedBackVC.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import <UIKit/UIKit.h>

@interface FeedBackVC : UIViewController
<UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@property (weak, nonatomic) IBOutlet UITextView *contentTV;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@end
