//
//  AboutTVC.h
//  MicroYangYang
//
//  Created by 潘威 on 14-9-5.
//
//

#import <UIKit/UIKit.h>

@interface AboutTVC : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *versonLabel;

@property (weak, nonatomic) IBOutlet UILabel *vesonTip;

@property (weak, nonatomic) IBOutlet UIButton *caseBtn;

@property (weak, nonatomic) IBOutlet UIButton *linkBtn;

@property (weak, nonatomic) IBOutlet UILabel *spliteLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

- (IBAction)caseBtnClicked;

- (IBAction)linkBtnClicked;


@end
