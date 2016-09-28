//
//  VerifyViewcontroller.m
//  HOM
//
//  Created by AppsbeeTechnology on 11/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "VerifyViewcontroller.h"
#import "OTPGeneratorService.h"
#import "OTPViewController.h"


@interface VerifyViewcontroller()
{

}

@end
@implementation VerifyViewcontroller
{
    NSString *strRandomNumber;
    NSString *strOTP;
    NSString *strResultStore;
}


//@synthesize strph;
  
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    int randomID = arc4random() % 9000 + 1000;
    NSLog(@"the random no is %d",randomID);
    strRandomNumber=[NSString stringWithFormat:@"%d",randomID];
    NSLog(@"%@", _strph);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"phoneexist"]!=0) {
        
        _lblVerify.text=@"It seems you are already registered with HOM";
    }else
    {
        _lblVerify.text=@"Please verify your phone with OTP";
        
        
    }
}

#pragma mark
#pragma mark IBAction Methods
#pragma mark

//[self performSegueWithIdentifier:@"" sender:self];
-(IBAction)btnOTPClicked:(id)sender
{
    
    [[OTPGeneratorService service]callPhoneNumberLoginServiceWithMobileNumber:self.strph OTP:strRandomNumber withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
            NSLog(@"result %@",result);
            strOTP=[NSString stringWithFormat:@"%@",result];
            [self performSegueWithIdentifier:@"OTPSegue" sender:self];
        }
    }];
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"OTPSegue"])
    {
        OTPViewController *controller = (OTPViewController *)segue.destinationViewController;
        controller.strResultStore= strOTP;
        controller.strph1=_strph;
        NSLog(@"%@ my OTP IS",controller.strResultStore);
    }
}

@end
