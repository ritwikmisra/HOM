//
//  SetClinicDetailViewController.h
//  HOM
//
//  Created by AppsbeeTechnology on 02/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "BaseViewController.h"

@protocol SetClinicDetailDelegate <NSObject>

@optional

-(void)getCurrentTime:(NSString *)TotalTime;

@end

@interface SetClinicDetailViewController : BaseViewController

@property(nonatomic,weak)id<SetClinicDetailDelegate>delegate;

@property(nonatomic,weak)IBOutlet UILabel *lblToTime;
@property(nonatomic,weak)IBOutlet UILabel *lblFromTime;
@property(nonatomic,weak)IBOutlet UITextField *txtTotalPatient;
@property(nonatomic,weak)IBOutlet UITextField *txtAvgTime;

@end
