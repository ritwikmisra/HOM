//
//  SetClinicDetailViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 02/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SetClinicDetailViewController.h"

#import "DatePickerViewController.h"

#import "availibilityDetailVC.h"

@interface SetClinicDetailViewController ()<DatePickerViewControllerDelegate,UITextFieldDelegate>
{
    DatePickerViewController *datePickerVC;
    BOOL isBtnToTimeTapped;
    NSString *strTimeDetail;
    NSString *strToTime;
    NSString *strTotalTime;
    NSString *strFromTime;
   // UIToolbar *NumberPadToolbar;
}

@end

@implementation SetClinicDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    datePickerVC=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DatePickerViewController"];
    datePickerVC.delegate = self;
    
//    
//    NumberPadToolbar = [[UIToolbar alloc] init];
//    [NumberPadToolbar sizeToFit];
//    
//    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
//                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                      target:nil action:nil];
//    
//    
//    
//    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
//                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
//                                      target:self action:@selector(doneClicked:)];
//    
//    NumberPadToolbar.items = @[flexBarButton, doneBarButton];
//    
//    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    _txtTotalPatient.delegate=self;
    _txtAvgTime.delegate=self;
//    _txtTotalPatient.inputAccessoryView = NumberPadToolbar;
//    _txtAvgTime.inputAccessoryView=NumberPadToolbar;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - ButtonAction
-(void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
}


- (IBAction)btnToTime:(id)sender {
    
    [self showDatePicker:YES];
    
}
- (IBAction)btnFromTime:(id)sender {
    
    [self showDatePicker:NO];

}

- (IBAction)doneBtnAction:(id)sender {
    
    
    if (strFromTime.length==0 || strToTime.length==0 || _txtTotalPatient.text.length==0 || _txtAvgTime.text.length==0)
    {
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertActionStyleDefault];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Field Cannot be blank" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        // Present action sheet.
        [self presentViewController:actionSheet animated:YES completion:nil];
    }
    else
    {
        if (strTimeDetail.length > 0)
        {
            [self.delegate getCurrentTime:strTimeDetail];
        }
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }
}

-(void)showDatePicker:(BOOL)value
{
    isBtnToTimeTapped = value;
    datePickerVC.view.frame = self.view.bounds;
    [self.view addSubview:datePickerVC.view];
    [self addChildViewController:datePickerVC];
    [datePickerVC didMoveToParentViewController:self];
    [self.view addSubview:datePickerVC.view];
}

//NSDate *date1= [formatter dateFromString:time1];
//NSDate *date2 = [formatter dateFromString:time2];

#pragma mark - DatePickerViewControllerDelegate

-(void)getTimefromTimepicker:(NSString *)fromTime
{
    
    if(!isBtnToTimeTapped)
    {
    strFromTime=fromTime;
    }else
    {
    strToTime=fromTime;
    }
    NSComparisonResult result = [strFromTime compare:strToTime];
    
    if(result == NSOrderedDescending)
    {
        NSLog(@"strFromTime is smaller than strToTime");
        self.lblFromTime.text=strFromTime;
//        
//        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
//        
//        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Time Should be greater than from time" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//            
//            // Cancel button tapped.
//            [self dismissViewControllerAnimated:YES completion:^{
//            }];
//            
//        }]];
//        // Present action sheet.
//        [self presentViewController:actionSheet animated:YES completion:nil];
//      
    }
    else if(result == NSOrderedAscending)
    {
        NSLog(@"strToTime is smaller than strFromTime");
        self.lblToTime.text=strToTime;
    }
    else
    {
        NSLog(@"strFromTime is equal to strToTime");
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Time Should not be equal" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            // Cancel button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
            
        }]];
        // Present action sheet.
        [self presentViewController:actionSheet animated:YES completion:nil];
    }

    
       strTimeDetail = [NSString stringWithFormat:@"%@ - %@",strFromTime,strToTime];
    NSLog(@"%@ time :",strTimeDetail);
}

#pragma mark
#pragma mark TextField delegate
#pragma mark


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType=UIReturnKeyDone;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 45.0),self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y+45.0),self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}


@end

