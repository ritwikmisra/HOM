//
//  DocClinicStep1.m
//  HOM
//
//  Created by AppsbeeTechnology on 19/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "DocClinicStep1.h"
#import <QuartzCore/QuartzCore.h>
#import "DocClinic1TableviewCellTableViewCell.h"
//#import "DocProViewController.m"


@interface DocClinicStep1 ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate>
{
    IBOutlet UITableView *tblDocClin;
    NSMutableArray *arrDocClin;
    NSMutableArray *arrStoreData2;
    NSString *strname;
    NSString *strAddress;
    NSString *strphno;
    NSString *strFees;
    AppDelegate *appDel;
    NSString *strDocName,*strdocphno;
    UIToolbar* NumberPadToolbar;

}

@end

@implementation DocClinicStep1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDel=  (AppDelegate *)[[UIApplication sharedApplication]delegate];
    strDocName=appdel.objDoctor.strName;
    strdocphno=appdel.objDoctor.strPhone;
    
    arrDocClin=[NSMutableArray arrayWithObjects:@"clinic Name",@"ph. no",@"address",@"fees", nil];
     arrStoreData2 = [[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"",nil];
    
    tblDocClin.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    DocClinic1TableviewCellTableViewCell *cell;
    
    cell.txtclinic.delegate=self;
    
    NumberPadToolbar = [[UIToolbar alloc] init];
    [NumberPadToolbar sizeToFit];
    
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    
    
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(doneClicked:)];
    
    NumberPadToolbar.items = @[flexBarButton, doneBarButton];
    cell.txtclinic.inputAccessoryView = NumberPadToolbar;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrDocClin.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==2)
    {
        return 112.0f;
    }else{
        return 60.f;
    
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"mySimpleTableItem";
    
    DocClinic1TableviewCellTableViewCell *cell = (DocClinic1TableviewCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (indexPath.row==0 || indexPath.row==1 || indexPath.row==3)
    {
        if (!cell)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DocClinic1TableviewCellTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
              cell.lblclinic.text=[arrDocClin objectAtIndex:indexPath.row];
            cell.txtclinic.autocorrectionType= UITextAutocorrectionTypeNo;
            cell.txtclinic.delegate=self;
            cell.txtclinic.tag=indexPath.row;
             cell.txtclinic.text=[arrStoreData2 objectAtIndex:indexPath.row];
            [cell.txtclinic addTarget:self action:@selector(textFieldEditingChange:) forControlEvents:UIControlEventEditingChanged];
        }
        
    }else
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DocClinic1TableviewCellTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:1];
        cell.txtvwclinic.autocorrectionType= UITextAutocorrectionTypeNo;
        cell.txtvwclinic.delegate=self;
        cell.txtvwclinic.tag=indexPath.row;
        cell.txtvwclinic.text=[arrStoreData2 objectAtIndex:indexPath.row];
        
    }
        if(indexPath.row==0)
        {
            cell.txtclinic.text= [NSString stringWithFormat:@"%@ 's private clinic",strDocName];
            
        cell.lblcliniccolor.backgroundColor = [UIColor colorWithRed:17.0f/255.f green:148.0f/255.0f blue:145.0f/255.0f alpha:1];
        cell.txtclinic.textColor=[UIColor colorWithRed:17.0f/255.f green:148.0f/255.0f blue:145.0f/255.0f alpha:1];
        }
    
    
    if(indexPath.row==1)
    {
    
        cell.txtclinic.text=strdocphno;
    
    }
    
    if(indexPath.row==1||indexPath.row==3)
    {
    
        cell.txtclinic.keyboardType=UIKeyboardTypeNumberPad;
    }
    
     cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark
#pragma mark Textfield delegate
#pragma mark

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType=UIReturnKeyDone;
    CGPoint newPoint = [textField convertPoint:textField.frame.origin fromView:tblDocClin];
    NSLog(@"%f",textField.frame.origin.y);
    NSLog(@"%f",newPoint.y);
  NSLog(@"%ld",(long)textField.tag);
    
//   if (textField.tag==0 )
//    {
//        strname=textField.text;
//   }
//   if (textField.tag==1 )
//    {
//        strphno=textField.text;
//   }
    
    if (textField.tag==3 )
    {

        [tblDocClin setContentOffset:CGPointMake(0,18)];
       // strFees=textField.text;
    }
    
}

-(void)textFieldEditingChange:(id)sender
{
    UITextField *txt = (id)sender;
    if (txt.tag==0 )
    {
        strname=txt.text;
    }
    if (txt.tag==1 )
    {
        strphno=txt.text;
    }
    if (txt.tag==3 )
    {
        strFees=txt.text;
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%ld",(long)textField.tag);
    [arrStoreData2 replaceObjectAtIndex:textField.tag withObject:textField.text];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%ld",(long)textField.tag);
    if (textField.tag==1)
    {
        if(textField.text.length >= 10 && range.length == 0)
        {
   
        return NO; // return NO to not change text
        }
    }
      return YES;
}


#pragma mark
#pragma mark IbAction method
#pragma mark

-(IBAction)btnDocClinicStep2Clicked:(id)sender {
    
   // [self performSegueWithIdentifier:@"Step2" sender:self];
    [self alertChecking];

}

-(void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark
#pragma mark textview delegate
#pragma mark

- (void) textViewDidBeginEditing:(UITextView *) textView
{
    textView.returnKeyType=UIReturnKeyDone;
    CGPoint newPoint = [textView convertPoint:textView.frame.origin fromView:tblDocClin];
    NSLog(@"%f",newPoint.y);
    
    NSLog(@"%ld",(long)textView.tag);
    
    if (textView.tag==2)
    {
        [tblDocClin setContentOffset:CGPointMake(0,-50)];
    }
}
-(void)textViewDidEndEditing:(UITextView *)textView
    {
        NSLog(@" Row Number %ld",(long)textView.tag) ;
        [arrStoreData2 replaceObjectAtIndex:textView.tag withObject:textView.text];
        NSLog(@"Store Array %@",arrStoreData2);
        if (textView.tag==2)
        {
            strAddress=textView.text;

            [tblDocClin setContentOffset:CGPointMake(0,20)];
        }
    }

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark
#pragma mark ALERT CHECKING
#pragma mark

-(BOOL)alertChecking
{
    
    if(strFees.length==0)
    {
        [self displayErrorWithMessage:@"Please enter your fees "];

    }
    if(strAddress.length==0)
    {
        [self displayErrorWithMessage:@"Please enter your address "];

    }
    return YES;
}
@end
