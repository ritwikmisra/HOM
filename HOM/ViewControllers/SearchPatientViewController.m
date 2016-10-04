//
//  SearchPatientViewController.m
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SearchPatientViewController.h"
<<<<<<< HEAD
#import "PatientCellTableViewCell.h"
#import "ModelPatient.h"
#import "SearchPatientService.h"
#import "ModelDoc.h"


@interface SearchPatientViewController ()<UITableViewDelegate,UITableViewDataSource>
=======
#import "SearchPatientService.h"
#import "PatientCellTableViewCell.h"
#import "ModelPatient.h"


@interface SearchPatientViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57
{
    IBOutlet UIView *vwTextSearch;
    IBOutlet UITextField *txtSearch;
    IBOutlet UITableView *tblSearchPatients;
<<<<<<< HEAD
    NSMutableArray *arrPatients;
    NSString *strDocId;
}
=======
    NSMutableArray *arrPatients,*arrSearchResults;
    NSString *strSearchText;
}

>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57
@end

@implementation SearchPatientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
    
    appdel.objDoctor.strId=strDocId;
    NSLog(@"%@",strDocId);
    
=======
>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57
    vwTextSearch.layer.borderWidth=1.0f;
    vwTextSearch.layer.borderColor=[UIColor colorWithRed:25/255.0f green:138/255.0f blue:138/255.0f alpha:1].CGColor;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, txtSearch.frame.size.height)];
    txtSearch.leftView = paddingView;
    txtSearch.leftViewMode = UITextFieldViewModeAlways;
    tblSearchPatients.separatorStyle=UITableViewCellSeparatorStyleNone;
<<<<<<< HEAD
    
   [[SearchPatientService service] callPatientServiceDocid:strDocId withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
    {
=======
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[SearchPatientService service]calPatientSearchServiceDocid:appdel.objDoctor.strId withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
<<<<<<< HEAD
            NSLog(@"result %@",result);
        }
    }];


}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
=======
            arrPatients=(id)result;
            [tblSearchPatients reloadData];
        }
    }];
>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark tableview delegates and datasource
#pragma mark

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
<<<<<<< HEAD
    return 2;
=======
    return arrPatients.count;
>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    PatientCellTableViewCell *cell = (PatientCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PatientCellTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
<<<<<<< HEAD
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"PatientPage"];
//   vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:vc animated:YES completion:NULL];
    
    [self performSegueWithIdentifier:@"patient" sender:self];

}


=======
    //NAME
    //GENDER,AGE
    //REF ID
    //SEARCH BY NAME,REF NO
    ModelPatient *obj=[arrPatients objectAtIndex:indexPath.row];
    cell.lblname.text=[NSString stringWithFormat:@"%@",obj.strPatientName];
    cell.lblGender.text=[NSString stringWithFormat:@"%@,%@",obj.strGender,obj.strAge];
    cell.lblRefno.text=[NSString stringWithFormat:@"Ref : %@",obj.strUserUniqueID];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark
#pragma mark textfield delegates
#pragma mark

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)textfieldEdited:(id)sender
{
    UITextField *text=(id)sender;
    strSearchText=text.text;
}

#pragma mark
#pragma mark IBACTIONS
#pragma mark

-(IBAction)btnSearchPressed:(id)sender
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF beginswith[c] %@",
                                    strSearchText];
    arrSearchResults = [[arrPatients filteredArrayUsingPredicate:resultPredicate] mutableCopy];
    NSLog(@"searchResults arr=%@",arrSearchResults);

}
>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57

@end
