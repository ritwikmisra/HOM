//
//  SidePanelDocProfileVCViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 26/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SidePanelDocProfileVCViewController.h"
#import "DepertmentService.h"
#import "DocRegService2.h"
#import "ModelDepartment.h"
#import "ProfileEditService.h"
#import "sidePannelDocProfileTableViewCell.h"
#import "LandingViewController.h"
#import "UIImageView+WebCache.h"

@interface SidePanelDocProfileVCViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    IBOutlet UITableView *tblProfileEdit;
    NSMutableArray *arrDocs, *arrStoreData,*arrAllDeptartments;
    NSString *strDoc;
    UIPickerView *pickerDepts;
    UIToolbar* toolbar;
    UIToolbar* keyboardToolbar;
    UIImage *imgStore;
    NSString *strimgpic;
    NSString *strFullName;
    NSString *strSpeciality;
    NSString *strSelectDep;
    NSString *strDegree;
    NSString *strEmail;
    NSString *strReg;
    NSString *strDescription,*strDeptID;
    NSString *strid;
    NSString *strPrefix;
  //  AppDelegate *appDel;
    BOOL isclicked;

}
@end

@implementation SidePanelDocProfileVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // appDel=  (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
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
            }
            //geting depertment id
            for(int i=0; i<arrAllDeptartments.count; i++)
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
//        
//        arrStoreData=[[NSMutableArray alloc]initWithObjects:appdel.objProfileEdit.strEditDocimage,appdel.objProfileEdit.strEditName,appdel.objProfileEdit.strSpecility,appdel.objProfileEdit.strDepName,appdel.objProfileEdit.strEditDegree,appdel.objProfileEdit.strEditEmail,appdel.objProfileEdit.strEditRegno,appdel.objProfileEdit.strEditDescription,nil];

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
        
//        strimgpic=appdel.objProfileEdit.strEditDocimage;
//        strFullName=[arrStoreData objectAtIndex:1];
//        strSpeciality=[arrStoreData objectAtIndex:2];
//        strSelectDep=[arrStoreData objectAtIndex:3];
//        strDegree=[arrStoreData objectAtIndex:4];
//        strEmail=[arrStoreData objectAtIndex:5];
//        strReg=[arrStoreData objectAtIndex:6];
//        strDescription=[arrStoreData objectAtIndex:7];
//        strid=appdel.objProfileEdit.strEditId;
        
    }
    else
    {
        arrStoreData = [[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",nil];
    }
    
    arrDocs = [NSMutableArray arrayWithObjects:@"",@"Full Name",@"Speciality",@"Select your department",@"Degree",@"Email",@"Registration ID",@"Description",@"submit",nil];
    
    NSLog(@"%@",appdel.objDoctor.strPrefix);
    strPrefix=appdel.objDoctor.strPrefix;
    NSLog(@"%@",strPrefix);

    
    strDoc=@"D";
    tblProfileEdit.bounces=NO;
    tblProfileEdit.separatorStyle=UITableViewCellSeparatorStyleNone;
    tblProfileEdit.delegate=self;
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
    

//   sidePannelDocProfileTableViewCell * cell = (sidePannelDocProfileTableViewCell *)[tblProfileEdit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark Base64Convert
#pragma mark

- (NSString *)encodeToBase64String:(UIImage *)image
{
    NSString *strProfileImage = [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return strProfileImage;
}

#pragma mark
#pragma mark IBAction
#pragma mark

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
  
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    // Present the view controller
    [self.frostedViewController presentMenuViewController];
}

- (void)btnEditProfile:(id)sender
{
    
    isclicked=YES;
    [tblProfileEdit reloadData];
    /*
     code by ritwik
     
     */
    
    /* code by sourav
    sidePannelDocProfileTableViewCell * cell = (sidePannelDocProfileTableViewCell *)[tblProfileEdit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.btnEdit.hidden=YES;
    cell.btnSave.hidden=NO;
    
    cell.btnImageUpload.userInteractionEnabled=YES;
    cell.btnDoctor.userInteractionEnabled=YES;
    cell.btnProfessor.userInteractionEnabled=YES;
     */
}

-(void)btnSaveProfile:(id)sender
{
    isclicked=NO;
    
    /* code by ritwik
     
     */
    
    /* code by sourav
    sidePannelDocProfileTableViewCell * cell = (sidePannelDocProfileTableViewCell *)[tblProfileEdit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.btnEdit.hidden=NO;
    cell.btnSave.hidden=YES;
    cell.btnImageUpload.userInteractionEnabled=NO;
    cell.btnDoctor.userInteractionEnabled=NO;
    cell.btnProfessor.userInteractionEnabled=NO;
     */
    
    //call webservice for upadte doctor profile
    
    [[ProfileEditService service]callEditDocProfileWebserviceForProfileEditWithId:strid Name:strFullName Specility:strSpeciality Degree:strDegree Email:strEmail Description:strDescription Regno:strReg Depertment:strid prefix:strPrefix DocImage:strimgpic withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
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
             [tblProfileEdit reloadData];
        }
         
     }];
}

-(void)btnDoctorPressed:(id)sender
{
    NSLog(@"doctor is pressed");
    strDoc=@"Dr.";
    
    sidePannelDocProfileTableViewCell *cell=(sidePannelDocProfileTableViewCell *)[self getSuperviewOfType:[UITableViewCell class] fromView:sender];
    
        [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt2"]];
    [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt1"]];
    //strprefix=strDoc;
}

-(void)btnProfessorPressed:(id)sender
{
    NSLog(@"professor is pressed");
    strDoc=@"Prof.";
    
   sidePannelDocProfileTableViewCell *cell=(sidePannelDocProfileTableViewCell *)[self getSuperviewOfType:[UITableViewCell class] fromView:sender];
    
    [cell.imgDoc setImage:[UIImage imageNamed:@"radio_bnt1"]];
    [cell.imgProf setImage:[UIImage imageNamed:@"radio_bnt2"]];
   }

-(void)btnImageUpload:(id)sender
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

-(void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
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


-(IBAction)LogOut
{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Do you want to logout" preferredStyle:UIAlertControllerStyleAlert];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"logout" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                            {
                                [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"IsLoggedIn"];
                                
                                self.frostedViewController.panGestureEnabled = NO;
                                
                                LandingViewController *obj =  [self.storyboard instantiateViewControllerWithIdentifier:@"LandingPage"];
                                [self.navigationController pushViewController:obj animated:YES];
                            }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tapped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];}

//  ================================================= \\

#pragma mark
#pragma mark TableView Delegate
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
     if (indexPath.row==7)
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    sidePannelDocProfileTableViewCell *cell;
    static NSString *strIdentifier = @"SimpleTableItem";
    if(indexPath.row==0)
    {
        sidePannelDocProfileTableViewCell *cellImage=[tableView dequeueReusableCellWithIdentifier:strIdentifier];
        
        if (!cellImage)
        {
            cellImage=[[[NSBundle mainBundle]loadNibNamed:@"sidePannelDocProfileTableViewCell" owner:self options:nil]objectAtIndex:0];
        }
          if(imgStore!=nil)
        {
            [cellImage.imgProfile setImage:imgStore];
        }
        else
        {
            NSString *strurl=[@"pro.healthonmobile.in/" stringByAppendingString:[@"uploadImage/doctor_image/" stringByAppendingString:strimgpic] ];
            
            [[SDImageCache sharedImageCache] removeImageForKey:strurl fromDisk:YES];
            
            [cellImage.imgProfile sd_setImageWithURL:[NSURL URLWithString: strurl] placeholderImage:[UIImage imageNamed:@"image_preview.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
                NSLog(@"Uploaded image url:%@",imageURL);
                
                imgStore = cell.imgProfile.image;
            }];
            
            NSLog(@"%@",strurl);
        }
        //code by ritwik
        if (isclicked==NO)
        {
            cellImage.btnSave.hidden=YES;
            cellImage.btnDoctor.userInteractionEnabled=NO;
            cellImage.btnProfessor.userInteractionEnabled=NO;
            cellImage.btnImageUpload.userInteractionEnabled=NO;
        }
        else
        {
            cellImage.btnEdit.hidden=YES;
            cellImage.btnDoctor.userInteractionEnabled=YES;
            cellImage.btnProfessor.userInteractionEnabled=YES;
            cellImage.btnImageUpload.userInteractionEnabled=YES;
        }
        
        [cellImage.btnImageUpload addTarget:self action:@selector(btnImageUpload:) forControlEvents:UIControlEventTouchUpInside];
        
        [cellImage.btnDoctor addTarget:self action:@selector(btnDoctorPressed:) forControlEvents:UIControlEventTouchUpInside];

        
        [cellImage.btnProfessor addTarget:self action:@selector(btnProfessorPressed:) forControlEvents:UIControlEventTouchUpInside];

        [cellImage.btnEdit addTarget:self action:@selector(btnEditProfile:) forControlEvents:UIControlEventTouchUpInside];
        
        [cellImage.btnSave addTarget:self action:@selector(btnSaveProfile:) forControlEvents:UIControlEventTouchUpInside];
        if ([strDoc isEqualToString:@"D"])
        {
            [cellImage.imgDoc setImage:[UIImage imageNamed:@"radio_bnt2"]];
            [cellImage.imgProf setImage:[UIImage imageNamed:@"radio_bnt1"]];
        }
        else
        {
            [cellImage.imgDoc setImage:[UIImage imageNamed:@"radio_bnt1"]];
            [cellImage.imgProf setImage:[UIImage imageNamed:@"radio_bnt2"]];
        }
        
         //
        
        
        /* code by sourav
        cellImage.btnImageUpload.userInteractionEnabled=NO;
        
        
        cellImage.btnDoctor.userInteractionEnabled=NO;

        [cellImage.btnDoctor addTarget:self action:@selector(btnDoctorPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        cellImage.btnProfessor.userInteractionEnabled=NO;
        
        [cellImage.btnProfessor addTarget:self action:@selector(btnProfessorPressed:) forControlEvents:UIControlEventTouchUpInside];
        
         [cellImage.btnEdit addTarget:self action:@selector(btnEditProfile:) forControlEvents:UIControlEventTouchUpInside];
        
         [cellImage.btnSave addTarget:self action:@selector(btnSaveProfile:) forControlEvents:UIControlEventTouchUpInside];
        cellImage.btnSave.hidden=YES;
        
        if ([strDoc isEqualToString:@"D"])
        {
            [cellImage.imgDoc setImage:[UIImage imageNamed:@"radio_bnt2"]];
            [cellImage.imgProf setImage:[UIImage imageNamed:@"radio_bnt1"]];
        }
        else
        {
            [cellImage.imgDoc setImage:[UIImage imageNamed:@"radio_bnt1"]];
            [cellImage.imgProf setImage:[UIImage imageNamed:@"radio_bnt2"]];
        }*/
        cell=cellImage;
    }
    

    else if(indexPath.row == arrDocs.count-1 )
    {
    cell=[[[NSBundle mainBundle]loadNibNamed:@"sidePannelDocProfileTableViewCell" owner:self options:nil]objectAtIndex:4];
        cell.hidden=YES;
    }
    else if(indexPath.row==3)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"sidePannelDocProfileTableViewCell" owner:self options:nil]objectAtIndex:1];
        cell.txtDepertment.tag=indexPath.row;
        cell.lblDepertment.text=[arrDocs objectAtIndex:indexPath.row];
        cell.txtDepertment.delegate=self;
        strSelectDep=cell.txtDepertment.text;
        pickerDepts.delegate=self;
        cell.txtDepertment.text=[arrStoreData objectAtIndex:indexPath.row];


    }
    else if(indexPath.row==arrDocs.count-2)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"sidePannelDocProfileTableViewCell" owner:self options:nil]objectAtIndex:3];
        cell.txtdes.tag=indexPath.row;
        cell.lblDes.text=[arrDocs objectAtIndex:indexPath.row];
        cell.txtdes.delegate=self;
        cell.txtdes.text=[arrStoreData objectAtIndex:indexPath.row];

    }
    else
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"sidePannelDocProfileTableViewCell" owner:self options:nil]objectAtIndex:2];
        cell.txtAll.tag=indexPath.row;
        cell.lblAll.text=[arrDocs objectAtIndex:indexPath.row];
        cell.txtAll.delegate=self;
         [cell.txtAll addTarget:self action:@selector(textFieldEditingChange:) forControlEvents:UIControlEventEditingChanged];
        cell.txtAll.autocorrectionType= UITextAutocorrectionTypeNo;
        cell.txtAll.text=[arrStoreData objectAtIndex:indexPath.row];

    }

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark
#pragma mark for picker view delegate
#pragma mark

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return arrAllDeptartments.count;
    
}

- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    sidePannelDocProfileTableViewCell * cell = (sidePannelDocProfileTableViewCell *)[tblProfileEdit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    ModelDepartment *objDept=[arrAllDeptartments objectAtIndex:row];
    cell.txtDepertment.text=objDept.strDeptName;
        strDeptID=objDept.strDeptId;
    NSLog(@"id for depertment : %@",strDeptID);
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    ModelDepartment *objDept=[arrAllDeptartments objectAtIndex:row];
    return objDept.strDeptName;
}



#pragma mark
#pragma mark textfield delegate
#pragma mark

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //fhd  NSLog(@"%ld",(long)textField.tag);
    
    textField.returnKeyType=UIReturnKeyDone;
   // CGPoint newPoint = [textField convertPoint:textField.frame.origin fromView:tblProfileEdit];
//    NSLog(@"%f",textField.frame.origin.y);
//    NSLog(@"%f",newPoint.y);
    
    NSLog(@"%ld",(long)textField.tag);
    if (textField.tag==1)
    {
        [tblProfileEdit setContentOffset:CGPointMake(0,10)];
    }
    if (textField.tag==2)
    {
        [tblProfileEdit setContentOffset:CGPointMake(0,70)];
    }
    if (textField.tag==3 )
    {
        [tblProfileEdit setContentOffset:CGPointMake(0,175)];
        strSelectDep=textField.text;
    }
    if (textField.tag==4)
    {
        [tblProfileEdit setContentOffset:CGPointMake(0,190)];
    }
    if (textField.tag==5)
    {
        [tblProfileEdit setContentOffset:CGPointMake(0,250)];
    }
//    if (textField.tag==6)
//    {
//        [tblProfileEdit setContentOffset:CGPointMake(0,315)];
//    }
    
    if(textField.tag==3)
    {
        textField.inputView=pickerDepts;
        textField.inputAccessoryView=keyboardToolbar;
    }
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
        [tblProfileEdit setContentOffset:CGPointMake(0,130)];
        strSelectDep=textField.text;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag==6)
    {
    [tblProfileEdit setContentOffset:CGPointMake(0,315) animated:YES];
    }
    if (isclicked==YES)
    {
        return YES;
    }else{
        return NO;
    }

}

#pragma mark
#pragma textview delegate
#pragma mark

- (void) textViewDidBeginEditing:(UITextView *) textView
{
    textView.returnKeyType=UIReturnKeyDone;
    CGPoint newPoint = [textView convertPoint:textView.frame.origin fromView:tblProfileEdit];
    NSLog(@"%f",newPoint.y);
    NSLog(@"%ld",(long)textView.tag);
    
//    if (textView.tag==7)
//    {
//        [tblProfileEdit setContentOffset:CGPointMake(0,435)];
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
        [tblProfileEdit setContentOffset:CGPointMake(0,100)];
        
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
        [tblProfileEdit setContentOffset:CGPointMake(0,435) animated:YES];
    }
    if (isclicked==YES)
    {
        return YES;
    }else{
    return NO;
    }
}



#pragma mark
#pragma mark imagepickerdelegate
#pragma mark

-(void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
        imgStore=image;
    //=================
    //for sending the image tos erver we convert it into base64
    if (imgStore!=nil)
    {
        strimgpic = [self encodeToBase64String:imgStore];
    }
    //reload particular cell of table view
    [tblProfileEdit beginUpdates];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSArray *indexPathArr = [[NSArray alloc]initWithObjects:indexPath, nil];
    [tblProfileEdit reloadRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationNone];
    [tblProfileEdit endUpdates];
    //
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
    if (strEmail.length!=0)
    {
        BOOL isValidEmail = [self isValidEmail:strEmail];
        
        if (!isValidEmail)
        {
            [self displayErrorWithMessage:@"you have  enter a wrong Email-id!!"];
            return NO;
        }
    }
    return YES;
}
@end
