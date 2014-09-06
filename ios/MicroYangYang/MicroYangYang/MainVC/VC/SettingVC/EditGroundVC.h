//
//  EditGroundVC.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import <UIKit/UIKit.h>

@interface EditGroundVC : UIViewController
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *groundTF;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@end
