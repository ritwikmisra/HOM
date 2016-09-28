//
//  SearchPatientViewController.m
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SearchPatientViewController.h"
#import "PatientCellTableViewCell.h"


@interface SearchPatientViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UIView *vwTextSearch;
    IBOutlet UITextField *txtSearch;
    IBOutlet UITableView *tblSearchPatients;
    NSMutableArray *arrPatients;
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
    return 2;
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
  

    return cell;
}

@end
