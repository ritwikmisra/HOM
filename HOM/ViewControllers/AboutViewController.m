//
//  AboutViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 29/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutPageTableviewCellTableViewCell.h"

@interface AboutViewController ()
{
NSMutableArray *arrDocs;
IBOutlet UITableView *tblAbout;
}
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 346)];
//    self.view = view;
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 100,200)];
//    label.text = @"Hey1!";
//    
//    [self.view addSubview:label];
    
    


    tblAbout.separatorStyle=UITableViewCellSelectionStyleNone;
    tblAbout.bounces=NO;
    
    arrDocs = [NSMutableArray arrayWithObjects:@"Age",@"Gender",@"Phone",@"Email",@"Address",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // AboutPageTableviewCellTableViewCell *cell;
    
    static NSString *strIdentifier = @"SimpleTableItem";
   
        AboutPageTableviewCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:strIdentifier];
        
        if (!cell)
        {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"AboutPageTableviewCellTableViewCell" owner:self options:nil]objectAtIndex:0];
            cell.lblAll.text=[arrDocs objectAtIndex:indexPath.row];
        }

    if(indexPath.row==0)
    {
        cell.lblAll.textColor = [UIColor colorWithRed:76.0f/255.f green:157.0f/255.0f blue:154.0f/255.0f alpha:1];


    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    

    return cell;


}

@end
