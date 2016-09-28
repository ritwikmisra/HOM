//
//  OTPViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 11/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "OTPViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "borderlabel.h"
#import "DocProTableViewViewController.h"
#import "VerifyViewcontroller.h"
#import "DocProViewController.h"
#import "DepertmentService.h"
#import "DocProTableViewViewController.h"
#import "OTPGeneratorService.h"
#import "ModelDoc.h"




@interface OTPViewController()<UITextFieldDelegate>
{
    IBOutlet UILabel *lbl1;
    IBOutlet UILabel *lbl2;
    IBOutlet UITextField *input;
    IBOutlet UIProgressView *progressVw;
    NSTimer *timer;
    float incrementVal ;
    IBOutlet UILabel *lblTimerVal;
    int currMinute;
    int currSeconds;
    IBOutlet UIImageView *imgLock;
    IBOutlet UIButton *btnManualVerification;
    UIToolbar* NumberPadToolbar;
    NSString *strStoreOTP;
    IBOutlet UILabel *lblNumber;
    NSString *strOTP;
    NSString *strRandomNumber;
    NSString *strphnumber;
    
}

@end
@implementation OTPViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    lbl1.layer.borderWidth=1.0f;
    lbl1.layer.borderColor=[UIColor colorWithRed:137.0f/255.0f green:137.0f/255.0f blue:137.0f/255.0f alpha:1].CGColor;
    lbl2.layer.borderWidth=1.0f;
    lbl2.layer.borderColor=[UIColor grayColor].CGColor;
    
    [borderlabel self];
    
    borderlabel *lbl = [[borderlabel alloc]init];
    lbl.leftInset = 10;
    input.delegate=self;
    
    
    [input setHidden:YES];
    [imgLock setHidden:YES];
    [_btnResend setHidden:YES];
    
    
    int randomID = arc4random() % 9000 + 1000;
    NSLog(@"the random no is %d",randomID);
    strRandomNumber=[NSString stringWithFormat:@"%d",randomID];
    
    strphnumber=appdel.objDoctor.strPhone;
//    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 1.5f);
//    progressVw.transform = transform;
    
    //// Timer
    
    currMinute=60.00;
    //    currSeconds=60;
    incrementVal = 0.0;
    
    
    NumberPadToolbar = [[UIToolbar alloc] init];
    [NumberPadToolbar sizeToFit];
    
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    
    
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(doneClicked:)];
    
    NumberPadToolbar.items = @[flexBarButton, doneBarButton];
    input.inputAccessoryView = NumberPadToolbar;
    
    lblNumber.text=_strph1;
    
    [self.btnResend addTarget:self action:@selector(btnResendOTP:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnResendOTP:(id)sender
{
    [[OTPGeneratorService service]callPhoneNumberLoginServiceWithMobileNumber:strphnumber OTP:strRandomNumber withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
            NSLog(@"result %@",result);
            strOTP=[NSString stringWithFormat:@"%@",result];
            NSLog(@"%@",strOTP);
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [progressVw setProgress:0.0];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.98
                                             target:self
                                           selector:@selector(timer)
                                           userInfo:nil
                                            repeats:YES];
}


- (void)timer
{
    //    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    //    {
    //        if(currSeconds==0)
    //        {
    //            currMinute-=1;
    //            currSeconds=59;
    //        }
    //        else if(currSeconds>0)
    //        {
    //            currSeconds-=1;
    //        }
    //        if(currMinute>-1)
    //        {
    //            [lblTimerVal setText:[NSString stringWithFormat:@"%d:%02d",currMinute,currSeconds]];
    //        }
    //        incrementVal=(float)currMinute*60.0f+currSeconds;
    //        NSLog(@"%f",incrementVal);
    //        if (incrementVal>=1)
    //        {
    //            [progressVw setProgress:incrementVal animated:YES];
    //        }
    //    }
    
    if (currMinute > 0)
    {
        currMinute=currMinute-1;
    }
    else if(currMinute==0)
    {
        [timer invalidate];
    }
   if(currMinute>-1)
    {
        [lblTimerVal setText:[NSString stringWithFormat:@"%d",currMinute]];
        incrementVal=currMinute-1;
        
    }
  if (incrementVal>-1)
    {
        [progressVw setProgress:incrementVal animated:YES];
    }
}

#pragma mark
#pragma mark textfield Delegate
#pragma mark


-(void)didReceiveMemoryWarning
{
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType=UIReturnKeyDone;
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    strStoreOTP=input.text;
    NSLog(@"%@",strStoreOTP);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldEditingChange:(id)sender
{
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (input.text.length >= 4 && range.length == 0)
    {
        return NO; // return NO to not change text
    }
    else
    {
        return YES;
    }
}


#pragma mark
#pragma mark IBAction method
#pragma mark


-(IBAction)btnDocProClick:(id)sender
{
    input.hidden=NO;
    imgLock.hidden=NO;
    progressVw.hidden=YES;
    lblTimerVal.hidden=YES;
    btnManualVerification.hidden=YES;
    _imgPen.hidden=YES;
    self.btnResend.hidden=NO;
    [timer invalidate];
     NSLog(@"%@ otp v.c",_strph1);
    
    
    //[self performSegueWithIdentifier:@"Docprosegue" sender:nil];
}

-(void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
    
    if ([strStoreOTP isEqualToString:_strResultStore]||[strStoreOTP isEqualToString:strOTP])
    {
        NSLog(@"%@",_strResultStore);
        NSLog(@"%@",strStoreOTP);
        [self performSegueWithIdentifier:@"Docprosegue" sender:self];
    }
    else
    {
        [self displayErrorWithMessage:@"Your OTP is mismatch"];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Docprosegue"])
    {
       
        DocProViewController *controller = (DocProViewController *)segue.destinationViewController;
        
        controller.strph2=_strph1;
        NSLog(@"%@ value" , controller.strph2);
        
    }
    
}


@end
