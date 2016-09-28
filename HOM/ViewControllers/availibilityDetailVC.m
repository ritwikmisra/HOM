//
//  availibilityDetailVC.m
//  HOM
//
//  Created by AppsbeeTechnology on 19/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "availibilityDetailVC.h"
#import "availibilityDetailCollectionViewCell.h"
#import "SetClinicDetailViewController.h"
#import "DatePickerViewController.h"
#import "ClinicDetailCell.h"
#import "RegisterPvtClinicService.h"

@interface availibilityDetailVC ()<UICollectionViewDataSource,UICollectionViewDataSource,SetClinicDetailDelegate,UITableViewDataSource,UITableViewDelegate>
{


    IBOutlet UICollectionView *colAvailable;
    NSMutableArray *arrDate;
    long i;
    long temp;
    SetClinicDetailViewController *ClinicDetail;
  IBOutlet  UITableView *tblClinicDetail;
    NSMutableArray *arrTableViewSlots;
    BOOL isselected;
    NSMutableArray *arrDayset;
    NSMutableArray *arrindexpath;
    NSMutableArray *arr;
    //string for webservice
   // NSString *strclinicname,*strphno,*strdocid,*straddress,*strclinicid;
   // NSArray *arr
    int numberOfWeeks;
    
}

@end

@implementation availibilityDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrDate=[NSMutableArray arrayWithObjects:@"MON",@"TUE",@"WED",@"THU",@"FRI",@"SAT",@"SUN", nil];
    
    arrTableViewSlots = [[NSMutableArray alloc]init];
    
    arrDayset=[[NSMutableArray alloc]init];
    arrindexpath=[[NSMutableArray alloc]init];
    
   // self.lblAvalDetail.text=strTimeDetail;
    
//    ClinicDetail=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
//
//    ClinicDetail.delegate=self;
    
    tblClinicDetail.bounces=NO;
   
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
#pragma mark collection view delegate
#pragma mark

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{

    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{

    if(section==0)
    {
        return 7;
    }else{
        return 30;
    }

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *identifier = @"Cell";
    availibilityDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    if (indexPath.section==0) {
            cell.lblAvailable.text=[arrDate objectAtIndex:indexPath.row];
        cell.lblAvailable.textAlignment=NSTextAlignmentCenter;
        cell.lblAvailable.textColor=[UIColor whiteColor];
        [cell.lblAvailable setFont:[UIFont fontWithName:@"helvetica neue" size:13]];

    }else if(indexPath.section==1)
    {
        if (indexPath.row<9) {
            cell.lblAvailable.text=[NSString stringWithFormat:@"0%ld",(long)indexPath.row+1];
        }else
            cell.lblAvailable.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
        
        [cell.lblAvailable setFont:[UIFont fontWithName:@"helvetica neue" size:11]];
        cell.lblAvailable.textColor=[UIColor blackColor];
    }
    
    return cell;
 }

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/10, self.view.frame.size.width/10);
}


- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{

    /* code by ritwik
     
     
     
     
     
     */
  
   int itemno =(int)indexPath.row+1;
    
    if(indexPath.section==1)
    {
        if (indexPath.row%7==0)
         {
                    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Chose Your Date Doctor" preferredStyle:UIAlertControllerStyleAlert];
             
            arr=[[NSMutableArray alloc]init];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Every Monday" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                {
                                    for (i=0; i<=30; i++)
                                    {
                                        if (i%7==0) {
                                            {
                                                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                                                cell.backgroundColor = [UIColor grayColor];
                                                cell.userInteractionEnabled=NO;

                                                [arr addObject:[NSString stringWithFormat:@"%ld",i]];
                                            }
                                        }
                                    }
                                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                                    ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                                    ClinicDetail.delegate=self;
                                    ClinicDetail.view.frame = self.view.bounds;
                                    [self.view addSubview:ClinicDetail.view];
                                    [self addChildViewController:ClinicDetail];
                                    [ClinicDetail didMoveToParentViewController:self];
                                    [arrDayset addObject:@"Every Monday"];
                                    
                                    [arrindexpath addObject:arr];
                                }]];
            
             if (indexPath.row==0) {
                 
        [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"1st week of monday of every month"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            i=0;
            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
            cell.backgroundColor = [UIColor grayColor];
            cell.userInteractionEnabled=NO;

        
          
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
            ClinicDetail.delegate=self;
            ClinicDetail.view.frame = self.view.bounds;
            [self.view addSubview:ClinicDetail.view];
            [self addChildViewController:ClinicDetail];
            [ClinicDetail didMoveToParentViewController:self];
            [arrDayset addObject:@"First Monday of every month"];
            [arrindexpath addObject:[NSString stringWithFormat:@"%ld",i]];
        }]];
             }
             
             //
             
             

        [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%d of every month",itemno] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

            UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
            cell.backgroundColor = [UIColor grayColor];
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
            ClinicDetail.delegate=self;
            ClinicDetail.view.frame = self.view.bounds;
            [self.view addSubview:ClinicDetail.view];
            [self addChildViewController:ClinicDetail];
            [ClinicDetail didMoveToParentViewController:self];
            [arrDayset addObject:@"On this date only"];
            [arrindexpath addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];

        }]];

        [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            // Cancel button tapped.
            [self dismissViewControllerAnimated:YES completion:^{
            }];
            
        }]];
        
        [self presentViewController:actionSheet animated:YES completion:nil];
    
}
        if (indexPath.row%7==1)
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
            
            arr=[[NSMutableArray alloc]init];

            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Every Tuesday" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                
                for (i=1; i<=30; i++) {
                    
                    if (i%7==1) {
                        {
                            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                            cell.backgroundColor = [UIColor grayColor];
                            cell.userInteractionEnabled=NO;
                            [arr addObject:[NSString stringWithFormat:@"%ld",i]];
                        }
                    }
                }
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail= [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                 ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                
                [arrDayset addObject:@"Every Tuesday"];
                [arrindexpath addObject:arr];
                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"First Tuesday of every Month" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                long t=1;
                
                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:t inSection:1]];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"First Tuesday of every month"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",t]];
                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%d of every month",itemno] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;

                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"On this date only"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                // Cancel button tapped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
                
            }]];

                [self presentViewController:actionSheet animated:YES completion:nil];
        }
        if (indexPath.row%7==2)
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
            
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Every Wednessday" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                arr=[[NSMutableArray alloc]init];
                
                for (i=1; i<=30; i++)
                {
                    if (i%7==2)
                    {
                        {
                            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                            cell.backgroundColor = [UIColor grayColor];
                            cell.userInteractionEnabled=NO;
                            [arr addObject:[NSString stringWithFormat:@"%ld",i]];
                        }
                    }
                }
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"Every Wednessday"];
                [arrindexpath addObject:arr];

            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"First Wednessday of every Month" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                long w=2;
                
                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:w inSection:1]];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"First Wednessday of every month"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",w]];
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%d of every month",itemno] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"On this date only"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];

            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tapped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
                
            }]];

            [self presentViewController:actionSheet animated:YES completion:nil];
        }
        
        if (indexPath.row%7==3)
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
            
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Every Thursday" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                arr=[[NSMutableArray alloc]init];
                for (i=1; i<=30; i++) {
                    
                    if (i%7==3) {
                        
                        
                        {
                            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                            cell.backgroundColor = [UIColor grayColor];
                            cell.userInteractionEnabled=NO;

                            [arr addObject:[NSString stringWithFormat:@"%ld",i]];
                        }
                    }
                }

                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"Every Tuesday"];
                [arrindexpath addObject:arr];
                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"First Thursday of every Month" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                long th=3;
                
                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:th inSection:1]];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"First Thursday of every month"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",th]];
                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%d of every month",itemno]style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"On this date only"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];

            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tapped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
                
            }]];
            [self presentViewController:actionSheet animated:YES completion:nil];
        }
        
        if (indexPath.row%7==4)
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
            
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Every Friday" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                arr=[[NSMutableArray alloc]init];
                for (i=1; i<=30; i++) {
                    
                    if (i%7==4) {
                        
                        {
                            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                            cell.backgroundColor = [UIColor grayColor];
                            cell.userInteractionEnabled=NO;

                            [arr addObject:[NSString stringWithFormat:@"%ld",i]];
                        }
                    }
                }
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                
                [arrDayset addObject:@"Every Friday"];
                [arrindexpath addObject:arr];
                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"First Friday of every Month" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                long f=4;
                
                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:f inSection:1]];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"First Friday of every month"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",f]];

            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%d of every month",itemno] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"On this date only"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];

            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tapped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
                
            }]];

            [self presentViewController:actionSheet animated:YES completion:nil];
        }
        
        if (indexPath.row%7==5)
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
            
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Every Saturday" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                arr=[[NSMutableArray alloc]init];
                
                for (i=1; i<=30; i++) {
                    
                    if (i%7==5) {
                        
                        {
                            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                            cell.backgroundColor = [UIColor grayColor];
                            cell.userInteractionEnabled=NO;

                            [arr addObject:[NSString stringWithFormat:@"%ld",i]];
                        }
                    }
                }

                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                
                [arrDayset addObject:@"Every Saturday"];

                [arrindexpath addObject:arr];
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"First Saturday of every Month" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                long sat=5;
                
                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:sat inSection:1]];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"First Saturday of every month"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",sat]];

                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%d of every month",itemno] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"On this date only"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row ]];
                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tapped.
                [self dismissViewControllerAnimated:YES completion:^{
                }];
                
            }]];

            [self presentViewController:actionSheet animated:YES completion:nil];
        }
        
        if (indexPath.row%7==6)
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleAlert];
            
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"Every Sunday" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                arr=[[NSMutableArray alloc]init];
                for (i=1; i<=30; i++) {
                    
                    if (i%7==6) {
                        
                        {
                            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                            cell.backgroundColor = [UIColor grayColor];
                            cell.userInteractionEnabled=NO;

                            [arr addObject:[NSString stringWithFormat:@"%ld",i ]];
                        }
                    }
                }
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"Every Sunday"];
                [arrindexpath addObject:arr];

            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"First Sunday of every Month" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                long sun=6;
                
                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:sun inSection:1]];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"First Sunday of every month"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",sun]];

                
            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%d of every month",itemno] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor grayColor];
                cell.userInteractionEnabled=NO;


                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                ClinicDetail = [storyboard instantiateViewControllerWithIdentifier:@"SetClinicDetailViewController"];
                ClinicDetail.delegate=self;
                ClinicDetail.view.frame = self.view.bounds;
                [self.view addSubview:ClinicDetail.view];
                [self addChildViewController:ClinicDetail];
                [ClinicDetail didMoveToParentViewController:self];
                [arrDayset addObject:@"On this date only"];
                [arrindexpath addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];

            }]];
            
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                // Cancel button tapped.
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
                
            }]];

            [self presentViewController:actionSheet animated:YES completion:nil];
        }
    }
}

/* -(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    if(indexPath.section==1)
    {
        if (indexPath.row%7==0)
        {
            for (i=0; i<=30; i++)
            {
                
                if (i%7==0)
                {
                    
                    {
            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
            cell.backgroundColor = [UIColor clearColor];
    
                    }
                }
            }
        }
        
        
    }
   
    if (indexPath.row%7==1)
    {
        
        for (i=1; i<=30; i++)
        {
            
            if (i%7==1)
            {
                {
                    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                    cell.backgroundColor = [UIColor clearColor];
                }
            }
        }
    }

    if (indexPath.row%7==2)
    {
        for (i=1; i<=30; i++)
        {
            if (i%7==2)
            {
                {
                    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                    cell.backgroundColor = [UIColor clearColor];
                }
            }
        }
    }
    
    if (indexPath.row%7==3)
    {
        for (i=1; i<=30; i++)
        {
            if (i%7==3)
            {
                {
                    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                    cell.backgroundColor = [UIColor clearColor];
                }
            }
        }
    }
    
    if (indexPath.row%7==4)
    {
        
        for (i=1; i<=30; i++)
        {
            
            if (i%7==4)
            {
                {
                    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                    cell.backgroundColor = [UIColor clearColor];
                }
            }
        }
    }
    
    if (indexPath.row%7==5)
    {
        
        for (i=1; i<=30; i++)
        {
            
            if (i%7==5)
            {
                {
                    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                    cell.backgroundColor = [UIColor clearColor];
                }
            }
        }
    }
    
    if (indexPath.row%7==6)
    {
        
        for (i=1; i<=30; i++)
        {
            
            if (i%7==6)
            {
                {
                    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
                    cell.backgroundColor = [UIColor clearColor];
                }
            }
        }
    }
}
*/
#pragma mark - SetClinicDetailDelegate

-(void)getCurrentTime:(NSString *)TotalTime
{
    [arrTableViewSlots addObject:TotalTime];
    
    //NSIndexPath *path = [NSIndexPath indexPathForRow:[arrTableViewSlots count]-1 inSection:0];
    NSArray *insertIndexPaths = [[NSArray alloc] initWithObjects:
                                 [NSIndexPath indexPathForRow:[arrTableViewSlots count]-1 inSection:0],
                                 nil];
    
    [tblClinicDetail beginUpdates];
    [tblClinicDetail insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    [tblClinicDetail endUpdates];
}

#pragma mark
#pragma mark ibaction 
#pragma mark

-(void)btnDelete:(id)sender
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tblClinicDetail];
    NSIndexPath *objindex = [tblClinicDetail indexPathForRowAtPoint:buttonPosition];
    
    [arrTableViewSlots removeObjectAtIndex:objindex.row];
    [arrDayset removeObjectAtIndex:objindex.row];
    NSArray *insertIndexPaths = [[NSArray alloc] initWithObjects:
                                 [NSIndexPath indexPathForRow:objindex.row inSection:0],
                                 nil];
    
    [tblClinicDetail beginUpdates];
    [tblClinicDetail deleteRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    [tblClinicDetail endUpdates];
    isselected=YES;
    [self Deleteindexpath:objindex];
}

-(void)Deleteindexpath:(NSIndexPath *)path
{
    int arrcount;
    if([[arrindexpath objectAtIndex:path.row] isKindOfClass:[NSArray class]])
    {
        arrcount =(int)[[arrindexpath objectAtIndex:path.row] count];
        for(int c=0;c<arrcount;c++)
        {
            UICollectionViewCell *cell = [colAvailable cellForItemAtIndexPath:[NSIndexPath indexPathForRow:[[[arrindexpath objectAtIndex:path.row] objectAtIndex:c] intValue] inSection:1]];
            cell.backgroundColor=[UIColor clearColor];
        }
    }else
    {
        UICollectionViewCell *cell = [colAvailable cellForItemAtIndexPath:[NSIndexPath indexPathForRow:[[arrindexpath objectAtIndex:path.row] intValue] inSection:1]];
        cell.backgroundColor=[UIColor clearColor];
    }
    
    [arrindexpath removeObjectAtIndex:path.row];
}

-(IBAction)btnDone:(id)sender
{
//    [[RegisterPvtClinicService service]callRegisterPvtClinicWebservicewithClinicName: phno: address: Docid: Clinicid: detail-Array: withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
//     {
//     if (isError)
//     {
//         [self displayErrorWithMessage:strMsg];
//     }
//     else
//     {
//         
//     
//     
//     }}];

}
#pragma mark
#pragma mark Tableview Delegate
#pragma mark

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrTableViewSlots.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    ClinicDetailCell *cell = (ClinicDetailCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
   NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ClinicDetailCell" owner:self options:nil];
        if (!cell)
        {
        cell = [nib objectAtIndex:0];
        }
        cell.lblTime.text = [arrTableViewSlots objectAtIndex:indexPath.row];
    cell.lblDay.text=[arrDayset objectAtIndex:indexPath.row];
    
        [cell.btnDeleteRecord addTarget:self action:@selector(btnDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark
#pragma mark SHOW WEEK POPUP
#pragma mark

-(void)showWeekPopUP
{
    
}

@end
