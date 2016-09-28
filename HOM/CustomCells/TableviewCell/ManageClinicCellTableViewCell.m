//
//  ManageClinicCellTableViewCell.m
//  HOM
//
//  Created by AppsbeeTechnology on 06/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ManageClinicCellTableViewCell.h"

@implementation ManageClinicCellTableViewCell


- (void)awakeFromNib {
    
    self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/30;
//    self.constHt.constant = [UIScreen mainScreen].bounds.size.height/6;
    
    // [self.imgProfile setBackgroundColor:[UIColor redColor]];
    [self.imgIcon.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    self.imgIcon.layer.cornerRadius = 1.3;
    self.imgIcon.layer.borderWidth = 1.0;
    self.imgIcon.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/15;
    self.imgIcon.layer.masksToBounds=YES;
    [self.imgIcon setBackgroundColor:[UIColor orangeColor]];
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
