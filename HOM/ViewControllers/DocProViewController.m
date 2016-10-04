//
//  DocProViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 13/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "DocProViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DocProTableViewViewController.h"
#import "DepertmentService.h"
#import "ModelDepartment.h"
#import "PhoneNumberLoginService.h"
#import "DocRegService.h"
#import "DocRegService2.h"
#import "LandingViewController.h"
#import "DocClinicStep1.h"
#import "UIImageView+WebCache.h"
#import "DemoRootVCViewController.h"


@interface DocProViewController()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UITableView *tblDocDetails;
    NSMutableArray *arrDocs, *arrAllDeptartments;
    NSString *strDoc;
    UIPickerView *pickerDepts;
    UIToolbar* toolbar;
    UITextField *actifText;
    UIToolbar* keyboardToolbar;
    NSMutableArray *arrStoreData;
    NSString *strFullName;
    NSString *strSpeciality;
    NSString *strSelectDep;
    NSString *strDegree;
    NSString *strEmail;
    NSString *strReg;
    NSString *strDescription,*strDeptID;
    UIImage *imgStore;
    NSString *strid;
    NSString *strimgpic;
    NSString *strprefix;
    NSString *Depid;
    BOOL isImageEdited;
   
    
}
@property (nonatomic,weak) UIImage *imgTemp;
@end
@implementation DocProViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    isImageEdited = NO;
    
        [[DepertmentService service]callDepartmentWebserviceWithCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
            NSLog(@"success");
            arrAllDeptartments = [NSMutableArray array];
            NSArray *arrDept = (id)result;
            for (int i =0; i<arrDept.count; i++)
            {
                ModelDepartment *modelDept = [[ModelDepartment alloc] initWithDictionary:[arrDept objectAtIndex:i]];
                [arrAllDeptartments addObject:modelDept];
                NSLog(@"name is%@", modelDept.strDeptName);
                NSLog(@"id is%@", modelDept.strDeptId);
            } for(int i=0; i<arrAllDeptartments.count; i++)
            {
                NSLog(@"dep id array %@",arrAllDeptartments);
                ModelDepartment *mdlDeptObj = [arrAllDeptartments objectAtIndex:i];
                if([mdlDeptObj.strDeptName isEqualToString:strSelectDep])
                {
                    strDeptID=mdlDeptObj.strDeptId;
                    NSLog(@"dep id is %@", strDeptID);
                    break;
                }
            }
        }
}];
    if (appdel.objDoctor.strId.length >0)
    {
        arrStoreData = [[NSMutableArray alloc]initWithObjects:appdel.objDoctor.strDocimage,appdel.objDoctor.strName,appdel.objDoctor.strSpecility,appdel.objDoctor.strDepertmentName,appdel.objDoctor.strDegree,appdel.objDoctor.strEmail,appdel.objDoctor.strRegid,appdel.objDoctor.strDescription,nil];
        strFullName=[arrStoreData objectAtIndex:1];
        strSpeciality=[arrStoreData objectAtIndex:2];
        strSelectDep=[arrStoreData objectAtIndex:3];
        strDegree=appdel.objDoctor.strDegree;
        strEmail=appdel.objDoctor.strEmail;
        strReg=appdel.objDoctor.strRegid;
        strDescription=appdel.objDoctor.strDescription;
       //========================//
        strid=appdel.objDoctor.strId;
        strimgpic=appdel.objDoctor.strDocimage;
        NSLog(@"my id is %@", strid);

    }
    
    else
    {
        arrStoreData = [[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",nil];
    }
    [tblDocDetails reloadData];
    arrDocs = [NSMutableArray arrayWithObjects:@"",@"Full Name",@"Speciality",@"Select your department",@"Degree",@"Email",@"Registration ID",@"Description",@"submit",nil];
    
    NSLog(@"%@",appdel.objDoctor.strPrefix);
    strprefix=appdel.objDoctor.strPrefix;
    NSLog(@"%@",strprefix);
    
    tblDocDetails.separatorStyle=UITableViewCellSeparatorStyleNone;
    strDoc=@"D";
    pickerDepts=[[UIPickerView alloc]init];
    pickerDepts.showsSelectionIndicator = YES;
    keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(doneClicked:)];
    
    keyboardToolbar.items = @[flexBarButton, doneBarButton];

    tblDocDetails.bounces=NO;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

#pragma mark
#pragma mark tableview delegate and datasource
#pragma mark

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrDocs.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return 250.0f;
    }
    else if (indexPath.row==7)
    {
        return 130.0f;
    }
    else if (indexPath.row==8)
    {
        return 50.0f;
    }
    else
    {
        return 60.0f;
    }
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//
//}

// self.view.frame.size.height/

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    DocProTableViewViewController *cell = (DocProTableViewViewController *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DocProTableViewViewController" owner:self options:nil];
    
    if (indexPath.row==0 )
    {
        if (!cell)
        {
            cell = [nib objectAtIndex:0];
        }
        if(imgStore!=nil)
        {
            [cell.imgProfile setImage:imgStore];
        }else{
        //set the image from server in imgprofile
        
//        cell.imgProfile.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://swift.gsfc.nasa.gov/results/releases/images/m31_uvot/m31_uvot_full.jpg"]]];
//
            
            NSString *strurl=[NSString stringWithFormat:@"%@%@",UP_URL_IMAGE_UPLOAD,strimgpic];
        
        [[SDImageCache sharedImageCache] removeImageForKey:strurl fromDisk:YES];
            
        [cell.imgProfile sd_setImageWithURL:[NSURL URLWithString: strurl] placeholderImage:[UIImage imageNamed:@"image_preview.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            NSLog(@"Uploaded image url:%@",imageURL);
            
            imgStore = cell.imgProfile.image;
        }];
            
        NSLog(@"%@",strurl);

        }
        [cell.btnImageUpload addTarget:self action:@selector(BtnImageUpload:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.btnDoctor addTarget:self action:@selector(btnDoctorPressed:) forControlEvents:UIControlEventTouchUpInside];
      
        
        [cell.btnProfessor addTarget:self action:@selector(btnProfessorPressed:) forControlEvents:UIControlEventTouchUpInside];
   
               //======================================
        // for existing user
        
        if ([appdel.objDoctor.strPrefix isEqual:@"Dr."] || [appdel.objDoctor.strPrefix isEqual:@""]) //9804578348
        {
            
            [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt2"]];
            [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt1"]];
            
            
        }else
        {
            [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt1"]];
            [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt2"]];
        }
        
        if ([strDoc isEqualToString:@"D"])
        {
            // if ([appdel.objDoctor.strPrefix isEqual:@"Dr."]|| [appdel.objDoctor.strPrefix isEqual:@""]) {
            [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt2"]];
            [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt1"]];
        }
        else
        {
            [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt1"]];
            [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt2"]];
        }
        
      }
    else if (indexPath.row == arrDocs.count-1 )
    {
        cell = [nib objectAtIndex:4];
        // here we perfrom segue with a tableview cell button
        [cell.btnSubmit addTarget:self action:@selector(BtnNextPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(indexPath.row==3)
    {
        cell = [nib objectAtIndex:1];
        cell.txtDepertment.tag=indexPath.row;
        cell.txtDepertment.delegate=self;
        cell.txtDepertment.text = [arrStoreData objectAtIndex:indexPath.row];
        strSelectDep=cell.txtDepertment.text;
        pickerDepts.delegate=self;
        
    }
    else if(indexPath.row==arrDocs.count-2 )
    {
        cell = [nib objectAtIndex:3];
        cell.txtdes.delegate = self;
        cell.txtdes.autocorrectionType= UITextAutocorrectionTypeNo;
        cell.txtdes.tag=indexPath.row;
        cell.txtdes.delegate=self;
        cell.txtdes.text=[arrStoreData objectAtIndex:indexPath.row];
    }
    else
    {
        cell = [nib objectAtIndex:2];
        cell.lblAll.text = [arrDocs objectAtIndex:indexPath.row];
        cell.txtAll.delegate=self;
        cell.txtAll.autocorrectionType= UITextAutocorrectionTypeNo;
        cell.txtAll.tag=indexPath.row;
        [cell.txtAll addTarget:self action:@selector(textFieldEditingChange:) forControlEvents:UIControlEventEditingChanged];
        cell.txtAll.text=[arrStoreData objectAtIndex:indexPath.row];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark
#pragma mark IBACTIONS
#pragma mark

-(void)btnDoctorPressed:(id)sender
{
    NSLog(@"doctor is pressed");
    strDoc=@"Dr.";
    DocProTableViewViewController *cell=(DocProTableViewViewController *)[self getSuperviewOfType:[UITableViewCell class] fromView:sender];
    [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt2"]];
    [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt1"]];
}

-(void)btnProfessorPressed:(id)sender
{
    NSLog(@"professor is pressed");
    strDoc=@"Prof.";
    DocProTableViewViewController *cell=(DocProTableViewViewController *)[self getSuperviewOfType:[UITableViewCell class] fromView:sender];
    [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt1"]];
    [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt2"]];
   // strprefix=strDoc;
    
}

-(void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
}

-(void)BtnImageUpload:(id)sender
{
    
    NSLog(@"hello world");
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"From Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // FromCamera button tappped.
        [self TakePhoto];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"From gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // FromGalary button tapped.
        [self GalaryPhoto];
        
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tapped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        
    }]];
        // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}
//table view cell button action

-(void)BtnNextPressed:(id)sender
{
   [self.view endEditing:YES];
//    [self isValidEmail:strEmail];
    
    if (isImageEdited == NO)
    {
        strimgpic = [self encodeToBase64String:imgStore];
    }
    
    BOOL isAlert=[self alertChecking];
    if (isAlert==YES)
    {
        if ([[NSUserDefaults standardUserDefaults]integerForKey:@"phoneexist"]==0)
        {
            NSLog(@"%@ docpro v.c",_strph2);
            
            [[DocRegService service] callRegistrationWebserviceWithImage:strimgpic phno:self.strph2  Name:strFullName Speciality:strSpeciality Depertment:strDeptID Degree:strDegree Email:strEmail Regid:strReg Description:strDescription prefix:strprefix withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
             {
                 if (isError)
                 {
                     [self displayErrorWithMessage:strMsg];
                 }
                 else
                 {
                     NSLog(@"result %@",result);
                     
                     NSDictionary *dict = (NSDictionary *)result;
                     appdel.objDoctor = [[ModelDoc alloc]initWithDictionary:dict];
                     
                  [self performSegueWithIdentifier:@"segueYourPushSegueName" sender:self];
                 }
             }];
        }
    
     else
        {
            //for existing user to update their information
          [[DocRegService2 service]callRegistrationWebserviceWithImage:strimgpic Docid:strid  Name:strFullName Speciality:strSpeciality Depertment:strDeptID Degree:strDegree Email:strEmail Regid:strReg Description:strDescription prefix:strprefix withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
             {
                 if (isError)
                 {
                     [self displayErrorWithMessage:strMsg];
                 }
                 else
                 {
                     NSLog(@"result %@",result);
                     
                     NSDictionary *dict = (NSDictionary *)result;
                     
                     appdel.objDoctor = [[ModelDoc alloc]initWithDictionary:dict];
                     
                    [self performSegueWithIdentifier:@"segueYourPushSegueName" sender:self];
                 }
                 
                 
                 //[tblDocDetails reloadData];
             }];
        }
    }
    else
    {
        
    }
}

-(void)TakePhoto
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    // imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
    imagePickerController.delegate=self;
}

-(void)GalaryPhoto
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    imagePickerController.delegate=self;
}

#pragma mark
#pragma mark Base64Convert
#pragma mark

- (NSString *)encodeToBase64String:(UIImage *)image
{
    NSString *strProfileImage = [UIImageJPEGRepresentation(image, 0.2) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        return strProfileImage;
}

#pragma mark
#pragma mark Check if a string is in base64 format
#pragma mark

-(BOOL)isBase64Data:(NSString *)input
{
    input=[[input componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
    if ([input length] % 4 == 0) {
        static NSCharacterSet *invertedBase64CharacterSet = nil;
        if (invertedBase64CharacterSet == nil) {
            invertedBase64CharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="]invertedSet];
        }
        return [input rangeOfCharacterFromSet:invertedBase64CharacterSet options:NSLiteralSearch].location == NSNotFound;
    }
    return NO;
}

#pragma mark
#pragma mark textfield delegate
#pragma mark

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //fhd  NSLog(@"%ld",(long)textField.tag);
    
    textField.returnKeyType=UIReturnKeyDone;
    CGPoint newPoint = [textField convertPoint:textField.frame.origin fromView:tblDocDetails];
    NSLog(@"%f",textField.frame.origin.y);
    NSLog(@"%f",newPoint.y);
    
    NSLog(@"%ld",(long)textField.tag);
    if (textField.tag==1)
    {
        strFullName=textField.text;
    }
    if (textField.tag==2)
    {
        [tblDocDetails setContentOffset:CGPointMake(0,10)];
    }
    if (textField.tag==3 )
    {
        [tblDocDetails setContentOffset:CGPointMake(0,130)];
        strSelectDep=textField.text;
    }
    if (textField.tag==4 )
    {
        [tblDocDetails setContentOffset:CGPointMake(0,132)];  
    }
    if (textField.tag==5 )
    {
        [tblDocDetails setContentOffset:CGPointMake(0,190)];
    }
//    if (textField.tag==6)
//    {
//        [tblDocDetails setContentOffset:CGPointMake(0,250)];
//    }
    if(textField.tag==3)
    {
        textField.inputView=pickerDepts;
        textField.inputAccessoryView=keyboardToolbar;
    }
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag==6)
    {
//        CGPoint pointInTable = [textField.superview convertPoint:textField.frame.origin toView:tblDocDetails];
//        CGPoint contentOffset = tblDocDetails.contentOffset;
//        
//        contentOffset.y = (pointInTable.y - textField.frame.size.height)/2;
//        
//        NSLog(@"contentOffset is: %@", NSStringFromCGPoint(contentOffset));
//        
        [tblDocDetails setContentOffset:CGPointMake(0,250) animated:YES];
    }
    return YES;
}

-(void)textFieldEditingChange:(id)sender
{
    UITextField *txt = (id)sender;
    [arrStoreData replaceObjectAtIndex:txt.tag withObject:txt.text];
    // NSLog(@" my tag %ld",(long)txt.tag);
    
    if (txt.tag==1)
    {
        strFullName=txt.text;
        NSLog(@"%@",strFullName);
    }
    if (txt.tag==2)
    {
        strSpeciality=txt.text;
        NSLog(@"%@",strSpeciality);
        
    }
    if (txt.tag==3 )
    {
        strSelectDep=txt.text;
        
        NSLog(@"%@",strSelectDep);
        
    }
    if (txt.tag==4)
    {
        strDegree=txt.text;
        NSLog(@"%@",strDegree);
        
    }
    if (txt.tag==5)
    {
        strEmail=txt.text;
        NSLog(@"%@",strEmail);
        
      
    }
    if (txt.tag==6)
    {
        strReg=txt.text;
        NSLog(@"%@",strReg);
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //NSLog(@"%ld",(long)textField.tag);
    
    if (textField.tag==3 )
    {
        [tblDocDetails setContentOffset:CGPointMake(0,130)];
        strSelectDep=textField.text;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



#pragma mark
#pragma mark for picker view delegate
#pragma mark

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;{
    
    return [arrAllDeptartments count];
}
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    DocProTableViewViewController * cell = (DocProTableViewViewController *)[tblDocDetails cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    ModelDepartment *objDept=[arrAllDeptartments objectAtIndex:row];
    cell.txtDepertment.text=objDept.strDeptName;
    strDeptID=objDept.strDeptId;
    NSLog(@"%@",strDeptID);
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    ModelDepartment *objDept=[arrAllDeptartments objectAtIndex:row];
    return objDept.strDeptName;
}

#pragma mark
#pragma mark imagepickerdelegate
#pragma mark

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
   // NSData *imageData =UIImageJPEGRepresentation(<#UIImage * _Nonnull image#>, <#CGFloat compressionQuality#>);

    imgStore=image;
    //=================
    //for sending the image tos erver we convert it into base64
    if (imgStore!=nil)
    {
        isImageEdited = YES;
        strimgpic = [self encodeToBase64String:imgStore];
    }
    //reload particular cell of table view
    [tblDocDetails beginUpdates];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSArray *indexPathArr = [[NSArray alloc]initWithObjects:indexPath, nil];
    [tblDocDetails reloadRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationNone];
    [tblDocDetails endUpdates];
    //
}

#pragma mark
#pragma textview delegate for dismiss keyboard
#pragma mark

- (void) textViewDidBeginEditing:(UITextView *) textView
{
    textView.returnKeyType=UIReturnKeyDone;
    CGPoint newPoint = [textView convertPoint:textView.frame.origin fromView:tblDocDetails];
    NSLog(@"%f",newPoint.y);
    NSLog(@"%ld",(long)textView.tag);
    
//    if (textView.tag==7)
//    {
//        [tblDocDetails setContentOffset:CGPointMake(0,370)];
//        
//        strDescription=textView.text;
//        NSLog(@"my description: %@", strDescription);
//    }
    
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@" Row Number %ld",(long)textView.tag) ;
    [arrStoreData replaceObjectAtIndex:textView.tag withObject:textView.text];
    //NSLog(@"Store Array %@",arrStoreData);
    // strDescription=[NSString stringWithFormat:@"%@",textView.text];
    //  strDescription=[arrStoreData objectAtIndex:7];
    NSString *textValue =[NSString stringWithFormat:@"%@", textView.text];
    NSLog(@"%@", textValue);
    
    if (textView.tag==7)
    {
        [tblDocDetails setContentOffset:CGPointMake(0,0)];
        
        strDescription=textView.text;
        NSLog(@"my description: %@", strDescription);
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

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (textView.tag==7)
    {
          [tblDocDetails setContentOffset:CGPointMake(0,250) animated:YES];
    }
    return YES;
}


#pragma mark
#pragma mark ALERT CHECKING
#pragma mark

-(BOOL)alertChecking
{
    if (strFullName.length==0)
    {
        [self displayErrorWithMessage:@"Please enter your full name!!"];
        return NO;
    }
    if (strSpeciality.length==0)
    {
        [self displayErrorWithMessage:@"Please enter your Specilization!!"];
        return NO;
    }
    if (strSelectDep.length==0)
    {
        [self displayErrorWithMessage:@"Please Select your Depertment!!"];
        return NO;
    }
    if (strDegree.length==0)
    {
        [self displayErrorWithMessage:@"Please enter your Degree!!"];
        return NO;
    }
    if (strDescription.length==0)
    {
        [self displayErrorWithMessage:@"Please enter a Description!!"];
        return NO;
    }
    if (strEmail.length!=0) {
       
    BOOL email = [self isValidEmail:strEmail];
    
    if (!email)
    
    {
        [self displayErrorWithMessage:@"you have  enter a wrong Email-id!!"];
        return NO;
    }
    }
    return YES;
}
#pragma mark
#pragma mark prepare for segue
#pragma mark


@end







