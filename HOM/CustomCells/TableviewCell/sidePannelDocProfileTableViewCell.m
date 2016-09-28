//
//  sidePannelDocProfileTableViewCell.m
//  HOM
//
//  Created by AppsbeeTechnology on 26/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "sidePannelDocProfileTableViewCell.h"

@implementation sidePannelDocProfileTableViewCell



- (void)awakeFromNib {
   
    self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/12;
    self.constHt.constant = [UIScreen mainScreen].bounds.size.height/6;
    
    // [self.imgProfile setBackgroundColor:[UIColor redColor]];
    [self.imgProfile.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    self.imgProfile.layer.cornerRadius = 8.0;
    self.imgProfile.layer.borderWidth = 2.4;
    self.imgProfile.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/6.5;
    self.imgProfile.layer.masksToBounds=YES;
    
}

-(void)viewWillLayoutSubviews{
    [self.imgProfile setBackgroundColor:[UIColor redColor]];
    self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height/2;
    self.imgProfile.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
