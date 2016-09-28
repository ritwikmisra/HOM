//
//  SidepanelTableviewCell.h
//  HOM
//
//  Created by AppsbeeTechnology on 19/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidepanelTableviewCell : UITableViewCell


@property(nonatomic,weak)IBOutlet UILabel *lbldoc;
@property(nonatomic,weak)IBOutlet UILabel *lblall;
@property(nonatomic,weak) IBOutlet UIImageView *imgdoc;
@property(nonatomic,weak) IBOutlet UIImageView *imgIcon;
@property (nonatomic,weak) IBOutlet UIButton *btnLogout;
@property(nonatomic,weak) IBOutlet UIImageView *imgLogout;

@property (nonatomic,weak) IBOutlet NSLayoutConstraint  *constHeight;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint  *constWidth;


@end
