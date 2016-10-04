//
//  SearchPatientViewController.m
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SearchPatientViewController.h"
#import "PatientCellTableViewCell.h"
#import "ModelPatient.h"
#import "SearchPatientService.h"
#import "ModelDoc.h"
#import "HomePageVCViewController.h"


@interface SearchPatientViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UIView *vwTextSearch;
    IBOutlet UITextField *txtSearch;
    IBOutlet UITableView *tblSearchPatients;
  NSMutableArray *arrRow;
//    NSDictionary *dictClinic;

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
    arrRow=[[NSMutableArray alloc]init];
    
    
   [[SearchPatientService service] callPatientServiceDocid:appdel.objDoctor.strId withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
    {
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
            NSLog(@"result %@",result);
            [arrRow addObject:result];
            NSLog(@"%@",arrRow);
        }
    }];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    return 3;
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

#pragma mark
#pragma mark IbAction
#pragma mark

-(IBAction)BackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}

@end
