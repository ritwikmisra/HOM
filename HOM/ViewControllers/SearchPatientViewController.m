//
//  SearchPatientViewController.m
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SearchPatientViewController.h"
#import "SearchPatientService.h"
#import "PatientCellTableViewCell.h"
#import "ModelPatient.h"


@interface SearchPatientViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    IBOutlet UIView *vwTextSearch;
    IBOutlet UITextField *txtSearch;
    IBOutlet UITableView *tblSearchPatients;
    NSMutableArray *arrPatients,*arrSearchResults;
    NSString *strSearchText;
}

@end

@implementation SearchPatientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    vwTextSearch.layer.borderWidth=1.0f;
    vwTextSearch.layer.borderColor=[UIColor colorWithRed:25/255.0f green:138/255.0f blue:138/255.0f alpha:1].CGColor;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, txtSearch.frame.size.height)];
    txtSearch.leftView = paddingView;
    txtSearch.leftViewMode = UITextFieldViewModeAlways;
    tblSearchPatients.separatorStyle=UITableViewCellSeparatorStyleNone;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[SearchPatientService service]calPatientSearchServiceDocid:appdel.objDoctor.strId withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
            arrPatients=(id)result;
            [tblSearchPatients reloadData];
        }
    }];
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
    return arrPatients.count;
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

@end
