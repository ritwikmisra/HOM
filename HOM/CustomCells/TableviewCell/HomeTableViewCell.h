//
//  HomeTableViewCell.h
//  HOM
//
//  Created by AppsbeeTechnology on 19/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UIButton *btnTime;
@property(nonatomic,weak) IBOutlet UIButton *btnTotalPatient;
@property(nonatomic,weak) IBOutlet UIButton *btnStatus;
@property(nonatomic,weak) IBOutlet UIButton *btnReload;
@property(nonatomic,weak) IBOutlet UILabel *lblTime;
@property(nonatomic,weak) IBOutlet UILabel *lblTotalPatient;
@property(nonatomic,weak) IBOutlet UILabel *lblStatus;
@property(nonatomic,weak) IBOutlet UILabel *lblClinicName;

@property(nonatomic,strong)IBOutlet UILabel *lblSectionName;
@property(nonatomic,strong)IBOutlet UILabel *lblPatientCount;


@property(nonatomic,strong)IBOutlet UIButton *btnAdBooking;

@end
