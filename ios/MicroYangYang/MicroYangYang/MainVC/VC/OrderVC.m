//
//  OrderVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-4.
//
//

#import "OrderVC.h"
#import "UIViewController+PWCommonMethod.h"
#import "TimeFormatter.h"

@interface OrderVC ()

@end

@implementation OrderVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showBackButton];
    
    [self initView];
    
    [self initData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self showTabBar];
}

- (void)initView
{
    
    _orderView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _orderView.layer.cornerRadius = 5;
    _orderView.layer.borderWidth = 1;
    _topImage.layer.masksToBounds = YES;
    _topImage.layer.cornerRadius = 5;
    
    _numberLabel.textColor = UIColorFromRGB(KNavBarBgColor);
    _nameLabel.textColor = UIColorFromRGB(KNavBarBgColor);
    _messageTimeLabel.textColor = UIColorFromRGB(KNavBarBgColor);
    _telLabel.textColor = UIColorFromRGB(KNavBarBgColor);
    _addressLabel.textColor = UIColorFromRGB(KNavBarBgColor);
    _positionLabel.textColor = UIColorFromRGB(KNavBarBgColor);
    _noteLabel.textColor = UIColorFromRGB(KNavBarBgColor);

}

- (void)initData
{
    _timeLabel.text = [TimeFormatter getDateForData:[NSDate date]];
    _timeLabel_M.text = [TimeFormatter getChinaMonthForData:[NSDate date]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)callBtnClicked:(UIButton *)sender
{
    ZJLog(@"点击了联系他。。。");
}

- (IBAction)cancelBtnClicked:(id)sender
{
    ZJLog(@"点击了取消。。。");

}

- (IBAction)sendOrder:(UIButton *)sender
{
    ZJLog(@"点击了发货。。。");

}
@end
