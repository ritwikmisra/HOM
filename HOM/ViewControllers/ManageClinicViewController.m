//
//  ManageClinicViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 06/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ManageClinicViewController.h"
#import "DocClinicStep1.h"
#import "ManageClinicCellTableViewCell.h"
#import "DocRelatedClinic.h"
#import "ClinicDetailCell.h"
#import "ManageClinicCellTableViewCell.h"
#import "ModelManageClinic.h"
#import "ModelDoc.h"
#import "LandingViewController.h"


@interface ManageClinicViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    NSString *strDocid;
    NSMutableArray *arrScetion;
    NSDictionary *dictClinic;
    NSMutableArray *arrRowinSection;
    IBOutlet UITableView *tblclinic;
    UIView *headerView;
    UILabel *headerLabel;
    NSMutableArray *arrClinicDetail;
    
    NSString *strDayName;
    NSString *strDocClinicName;
    NSMutableArray *arrSlotsDetail;
    NSString *strStarttime;
    NSString *strEndtime;
    NSString *strstartMrdn;
    NSString *strendMrdn;
    NSString *date;
    NSArray *arrRow;
}

@end

@implementation ManageClinicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tblclinic.separatorColor = [UIColor colorWithRed:192.0f/255.0f green:192.0f/255.0f blue:192.0f/255.0f alpha:1];
strDocid=appdel.objDoctor.strId;
  
    
    [[DocRelatedClinic service] callDocRelatedClinicWebServicewithDocid:strDocid withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
        if (isError)
        {
            [self displayErrorWithMessage:strMsg];
        }
        else
        {
            NSLog(@"result %@",result);
            dictClinic = (NSDictionary *)result;
            arrScetion = [[NSMutableArray alloc]init];
            arrScetion=[dictClinic objectForKey:@"doctor_rel_clinic"];
            [tblclinic reloadData];
            arrRowinSection=[[NSMutableArray alloc]init];
            
            arrClinicDetail=[[NSMutableArray alloc] init];
            
//            arrRow=[[[arrScetion objectAtIndex:indexPath.section] objectForKey:@"slots"] objectAtIndex:indexPath.row]]
            
           // arrRow=[[arrScetion objectAtIndex:indexpath.section]objectForKey:@"slots"];
            
           for (int i=0; i<arrScetion.count; i++)
            {
                ModelManageClinic *obj=[[ModelManageClinic alloc] initWithDictionary:[arrScetion objectAtIndex:i]];
                [arrClinicDetail addObject:obj];
            }
        }
    } ];
   
    tblclinic.sectionHeaderHeight = UITableViewAutomaticDimension;
    tblclinic.estimatedSectionHeaderHeight = 50;
    tblclinic.bounces=NO;
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark Tableview delegate
#pragma mark

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [arrScetion count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  arrRowinSection =[[arrScetion objectAtIndex:section]objectForKey:@"slots"];
//    return [[[arrScetion objectAtIndex:section]objectForKey:@"slots"] count];
    return [arrRowinSection count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10)];
    ///Create custom view to display section header... ///
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10,tableView.frame.size.width*2, 30)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    [label setTextColor:[UIColor colorWithRed:125.0f/255.0f green:125.0f/255.0f blue:125.0/255.0f alpha:1]];
    ModelManageClinic *obj = [arrClinicDetail objectAtIndex:section];
    NSString *string =obj.strClinicname;
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor whiteColor]];
    view.layer.masksToBounds = true;
//   view.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor colorWithRed:215.0f/215.0f green:215.0f/255.0f blue:215.0f/255.0f alpha:1]);
    view.layer.borderWidth = 1.0;
    


    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"clinicCell";
    ManageClinicCellTableViewCell *cell = (ManageClinicCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ManageClinicCellTableViewCell" owner:self options:nil];
    
        if (!cell)
        {
            cell = [nib objectAtIndex:0];
        }
    ModelManageClinic *obj = [arrClinicDetail objectAtIndex:indexPath.section];
    
    cell.lblTime.text= [NSString stringWithFormat:@"%@ %@ - %@ %@",[[obj.arrSlots objectAtIndex:indexPath.row]strDocStartTime],[[obj.arrSlots objectAtIndex:indexPath.row]strstartMeridian],[[obj.arrSlots objectAtIndex:indexPath.row]strDocEndTime],[[obj.arrSlots objectAtIndex:indexPath.row]strEndMeridian]];
    
       cell.lblDay.text=[[obj.arrSlots objectAtIndex:indexPath.row]strDocAvaiableDayName];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark
#pragma mark ibaction
#pragma mark


- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    
    [self.frostedViewController presentMenuViewController];
    
}

-(IBAction)btnAddPvtClinic:(id)sender
{
    
    
    
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
    
    [self presentViewController:actionSheet animated:YES completion:nil];

}



@end
