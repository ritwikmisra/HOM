//
//  ReportViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 29/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ReportViewController.h"
#import "ReportCollectionViewCell.h"

@interface ReportViewController ()
{

}
@property(nonatomic,weak) IBOutlet UITableView *tblReport;
@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tblReport.separatorStyle=UITableViewCellSeparatorStyleNone;

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
    ReportCollectionViewCell *cell = (ReportCollectionViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ReportCollectionViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}



@end
