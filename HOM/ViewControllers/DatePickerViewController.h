//
//  DatePickerViewController.h
//  HOM
//
//  Created by AppsbeeTechnology on 02/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "BaseViewController.h"

@protocol DatePickerViewControllerDelegate <NSObject>

@optional
-(void)getTimefromTimepicker:(NSString *)fromTime;
@end

@interface DatePickerViewController : BaseViewController

@property(nonatomic,weak)id<DatePickerViewControllerDelegate>delegate;
@property(nonatomic,weak) IBOutlet UIDatePicker *TimePick;

@end
