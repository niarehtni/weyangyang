//
//  VoiceSettingTVC.m
//  MicroYangYang
//
//  Created by 潘威 on 14-9-4.
//
//

#import "VoiceSettingTVC.h"
#import "UIViewController+PWCommonMethod.h"

@interface VoiceSettingTVC ()
{
    UITableViewCell *_lastSelectCell;
}
@end

@implementation VoiceSettingTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self showBackButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            [self setImageAndTextColor:cell imageName:@"ic_select.png" color:UIColorFromRGB(KNavBarBgColor)];
            _lastSelectCell = cell;
        }
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        [self setImageAndTextColor:_lastSelectCell imageName:nil color:[UIColor blackColor]];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [self setImageAndTextColor:cell imageName:@"ic_select.png" color:UIColorFromRGB(KNavBarBgColor)];
        _lastSelectCell = cell;
    }
}

- (IBAction)switchChanged:(UISwitch *)sender
{
    
}
//配置UITableViewCell
- (void)setImageAndTextColor:(UITableViewCell *)cell imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *img = (UIImageView *)[cell viewWithTag:2];
    if (imageName != nil) {
        if (img == nil) {
            img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        }
        img.frame = CGRectMake(20, 17, 21, 15);
        img.tag = 2;
        [cell addSubview:img];
    }
    else
    {
        [img removeFromSuperview];
    }
    UILabel *lab = (UILabel *)[cell viewWithTag:1];
    lab.textColor = color;
}

@end
