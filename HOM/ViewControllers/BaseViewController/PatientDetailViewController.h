//
//  PatientDetailViewController.h
//  HOM
//
//  Created by AppsbeeTechnology on 29/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "BaseViewController.h"

@interface PatientDetailViewController : BaseViewController
@property(nonatomic,weak)IBOutlet UIImageView *imgProfilePic;
//self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/12;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint  *constWidth;

@end
