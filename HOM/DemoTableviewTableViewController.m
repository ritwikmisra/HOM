//
//  DemoTableviewTableViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 19/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "DemoTableviewTableViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "DemoNavigationVCViewController.h"
#import "HomePageVCViewController.h"
#import "SidepanelTableviewCell.h"
#import "sidePannelDocProfileTableViewCell.h"
#import "SidePanelDocProfileVCViewController.h"
#import "ManageClinicViewController.h"
#import "LandingViewController.h"
#import "UIImageView+WebCache.h"

@interface DemoTableviewTableViewController ()
{

    NSMutableArray *arrdoc ;
    NSMutableArray   *arrIcon;
    IBOutlet UITableView *tblDocDetails;
    AppDelegate *appDel;
    

}

@end

@implementation DemoTableviewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDel=  (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    arrdoc = [[NSMutableArray alloc]initWithObjects:@"",@"HOME",@"MANAGE CLINIC",@"PROFILE",@"PATIENTS",@"LOGOUT" ,nil];
    
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // arrIcon=[[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"", nil];
    
    arrIcon = [[NSMutableArray alloc] initWithObjects:
               @"",
               [UIImage imageNamed:@"home_icon.png"],
               [UIImage imageNamed:@"manage_clinic.png"],
               [UIImage imageNamed:@"profile_icon.png"],
               [UIImage imageNamed:@"patient_group.png"],
               @"",
               nil];
    // self.navigationController.navigationBar.hidden = NO;
    
    tblDocDetails.bounces=NO;
    tblDocDetails.separatorStyle=UITableViewCellSeparatorStyleNone;
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrdoc.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==arrdoc.count-1)
    {
        return 70.0f;
        
    }else if(indexPath.row==0)
    {
        return 120.0f;
    }else
    {
    
        return 100.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString *cellIdentifier = @"cell";
    //   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//        }
    SidepanelTableviewCell *cell = (SidepanelTableviewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SidepanelTableviewCell" owner:self options:nil];
    
    if (indexPath.row==0 )
    {
        if (!cell)
        {
            cell = [nib objectAtIndex:0];
            cell.lbldoc.text= appDel.objDoctor.strName;
            
            NSString *strurl = [NSString stringWithFormat:@"pro.healthonmobile.in/uploadImage/doctor_image/%@",appDel.objDoctor.strDocimage];
            
            [cell.imgdoc sd_setImageWithURL:[NSURL URLWithString:strurl] placeholderImage:[UIImage imageNamed:@"image_preview.png"]];
        
        }
        
    }else if (indexPath.row==arrdoc.count-1)
    {
        cell=[nib objectAtIndex:2];
        cell.imgLogout.image=[UIImage imageNamed:@"logout.png"];
        [cell.btnLogout addTarget:self action:@selector(BtnLogoutPressed:) forControlEvents:UIControlEventTouchUpInside];
    }else
    {
        cell=[nib objectAtIndex:1];
        cell.lblall.text = [arrdoc objectAtIndex:indexPath.row];
        cell.imgIcon.image=[arrIcon objectAtIndex:indexPath.row];
    }
   // cell.textLabel.text = [arrdoc objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       if (indexPath.row==1)
       {
           HomePageVCViewController *comments =  [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
         [self.frostedViewController setContentViewController:comments];
            [self.frostedViewController hideMenuViewController];
       }else if (indexPath.row==3)
      { SidePanelDocProfileVCViewController *comments =  [self.storyboard instantiateViewControllerWithIdentifier:@"profileEdit"];
           [self.frostedViewController setContentViewController:comments];
           [self.frostedViewController hideMenuViewController];
          
          
    
       }else if(indexPath.row==2)
       {
           ManageClinicViewController *comments =  [self.storyboard instantiateViewControllerWithIdentifier:@"ManageClinic"];
           [self.frostedViewController setContentViewController:comments];
           [self.frostedViewController hideMenuViewController];
       }
    
    else if (indexPath.row==0)
    {
        
    }
    else if(indexPath.row==5)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"IsLoggedIn"];
        
                     LandingViewController *obj =  [self.storyboard instantiateViewControllerWithIdentifier:@"LandingPage"];
                        [self.navigationController pushViewController:obj animated:YES];
    }
       else
       {
            DemoNavigationVCViewController *comments =  [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
            [self.frostedViewController setContentViewController:comments];
            [self.frostedViewController hideMenuViewController];
            
        }
}

-(void)BtnLogoutPressed:(id)sender
{


}



@end
