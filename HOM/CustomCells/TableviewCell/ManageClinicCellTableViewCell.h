//
//  ManageClinicCellTableViewCell.h
//  HOM
//
//  Created by AppsbeeTechnology on 06/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageClinicCellTableViewCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel *lblDay;
@property(nonatomic,weak) IBOutlet UILabel *lblTime;
@property(nonatomic,weak) IBOutlet UILabel *lblClinicName;
@property(nonatomic,strong)IBOutlet UIImageView *imgIcon;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint  *constWidth;
//@property(nonatomic,weak)IBOutlet UIButton *btnImageClinic;



@end
