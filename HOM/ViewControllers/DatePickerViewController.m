//
//  DatePickerViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 02/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
{
    NSString *strTime;

    NSString *strSetTime;
}

@end

@implementation DatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.TimePick.datePickerMode=UIDatePickerModeTime;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPickTime:(id)sender
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"hh:mm a"]; //12hr time format
    strSetTime = [outputFormatter stringFromDate:self.TimePick.date];
    // [outputFormatter release];

    [self.delegate getTimefromTimepicker:strSetTime];
    
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
}

@end
