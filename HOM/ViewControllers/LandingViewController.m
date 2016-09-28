//
//  LandingViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 08/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "LandingViewController.h"
#import "PhoneNumberLoginService.h"
#import "VerifyViewcontroller.h"


@interface  LandingViewController()<UITextFieldDelegate>
{
 UIToolbar* NumberPadToolbar;
}

@end

@implementation LandingViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _txtPhno.delegate=self;
    
    NumberPadToolbar = [[UIToolbar alloc] init];
    [NumberPadToolbar sizeToFit];
    
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    
    
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(doneClicked:)];
    
    NumberPadToolbar.items = @[flexBarButton, doneBarButton];
    _txtPhno.inputAccessoryView = NumberPadToolbar;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.txtPhno.text=@"";
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark
#pragma mark IBAction Methods
#pragma mark

//[self performSegueWithIdentifier:@"" sender:self];
-(IBAction)btnVerifyClicked:(id)sender
{
    if (self.txtPhno.text.length<10)
    {
        [self displayErrorWithMessage:@"Please enter a phone number of 10 digits!!"];
    }
    else
    {
        [self callWebService];
    }
}

-(void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark
#pragma mark textfield delegate
#pragma mark

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType=UIReturnKeyDone;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
 

    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 152.0),self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y+152.0),self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= 10 && range.length == 0)
    {
        return NO; // return NO to not change text
    }
    else
    {
        return YES;
    }
}

#pragma mark
#pragma mark call Phone Number WEBSERVICE
#pragma mark

-(void)callWebService
{
        [[PhoneNumberLoginService service]callPhoneNumberLoginServiceWithMobileNumber:self.txtPhno.text withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
            NSLog(@"%ld",[result integerValue]);
            [result integerValue];
            [self performSegueWithIdentifier:@"segueVerify" sender:self];
        }
    }];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueVerify"])
    {
        NSLog(@"%@",_txtPhno.text);
        VerifyViewcontroller *controller = (VerifyViewcontroller *)segue.destinationViewController;
        controller.strph=_txtPhno.text;
         NSLog(@"%@",controller.strph);
       
    }
}

@end
