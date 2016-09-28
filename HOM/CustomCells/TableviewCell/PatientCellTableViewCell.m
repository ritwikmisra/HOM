//
//  PatientCellTableViewCell.m
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "PatientCellTableViewCell.h"

@implementation PatientCellTableViewCell

- (void)awakeFromNib
{
    self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/180;
    //    self.constHt.constant = [UIScreen mainScreen].bounds.size.height/6;
    // [self.imgProfile setBackgroundColor:[UIColor redColor]];
    [self.imgDoc.layer setBorderColor: [[UIColor blackColor] CGColor]];
    self.imgDoc.layer.cornerRadius = 1.3;
    self.imgDoc.layer.borderWidth = 1.0;
    self.imgDoc.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/14;
    self.imgDoc.layer.masksToBounds=YES;
    _vwBorder.layer.borderColor = [UIColor grayColor].CGColor;
    _vwBorder.layer.borderWidth = 1.0f;
}

-(void)viewWillLayoutSubviews{
    //    [self.imgIcon setBackgroundColor:[UIColor colorWithRed:240.f/255.0f green:124.0f/255.0f blue:66.0f/255.0f alpha:1]];
    //    self.imgIcon.layer.cornerRadius = self.imgIcon.frame.size.height/2;
    //    self.imgIcon.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
