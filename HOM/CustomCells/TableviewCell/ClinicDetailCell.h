//
//  ClinicDetailCell.h
//  HOM
//
//  Created by AppsbeeTechnology on 07/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClinicDetailCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel *lblTime;
@property(nonatomic,weak) IBOutlet UILabel *lblDay;
@property(nonatomic,weak)IBOutlet UIButton *btnDeleteRecord;
@property(nonatomic,weak) IBOutlet UIImageView *imgSuperview;



@end
