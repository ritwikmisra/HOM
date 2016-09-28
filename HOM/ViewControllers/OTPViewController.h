//
//  OTPViewController.h
//  HOM
//
//  Created by AppsbeeTechnology on 11/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "BaseViewController.h"

@interface OTPViewController : BaseViewController


@property(nonatomic,weak) NSString *strph1;
@property(nonatomic,weak) NSString *strResultStore;
@property(nonatomic,weak)IBOutlet UIButton *btnResend;
@property(nonatomic,strong)IBOutlet UIImageView *imgPen;

@property(nonatomic,strong) NSString *strph;


@end
