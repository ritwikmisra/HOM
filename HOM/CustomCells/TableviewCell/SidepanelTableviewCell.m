//
//  SidepanelTableviewCell.m
//  HOM
//
//  Created by AppsbeeTechnology on 19/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SidepanelTableviewCell.h"

@implementation SidepanelTableviewCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/14.5;
  //  self.constHeight.constant = [UIScreen mainScreen].bounds.size.height/37.6;
    
    // [self.imgProfile setBackgroundColor:[UIColor redColor]];
    [self.imgdoc.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    self.imgdoc.layer.cornerRadius = 8.0;
    self.imgdoc.layer.borderWidth = 1.0;
    self.imgdoc.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/8.4;
    self.imgdoc.layer.masksToBounds=YES;
//    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width/15);
//    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height/26.8);

    // Initialization code
        
}

-(void)viewWillLayoutSubviews{
    
 
    
}



@end
