//
//  PatientCellTableViewCell.h
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientCellTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet NSLayoutConstraint  *constWidth;
@property(nonatomic,strong)IBOutlet UIImageView *imgDoc;
@property(nonatomic,weak)IBOutlet UILabel *lblname;
@property(nonatomic,weak)IBOutlet UILabel *lblGender;
@property(nonatomic,weak)IBOutlet UILabel *lblRefno;
@property(nonatomic,weak)IBOutlet UIView *vwBorder;

@end
