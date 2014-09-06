//
//  OrderVC.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-4.
//
//

#import <UIKit/UIKit.h>

@interface OrderVC : UIViewController

@property (weak, nonatomic) IBOutlet UIView *orderView;

@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel_M;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *messageTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *telLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *positionLabel;

@property (weak, nonatomic) IBOutlet UILabel *noteLabel;


- (IBAction)callBtnClicked:(UIButton *)sender;


- (IBAction)cancelBtnClicked:(id)sender;

- (IBAction)sendOrder:(UIButton *)sender;

@end
