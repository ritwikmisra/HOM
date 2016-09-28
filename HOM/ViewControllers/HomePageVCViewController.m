//
//  HomePageVCViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 19/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "HomePageVCViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeTableViewCell.h"
#import "ManageClinicViewController.h"
#import "LandingViewController.h"
#import "ModelDoc.h"
#import "DoctorClinicDetailService.h"
#import "ModelDoctorClinic.h"
#import "ModelDoctorSlots.h"

@interface HomePageVCViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UICollectionView *colDate;
    IBOutlet UITableView *tblCLinicDetail;
    NSMutableArray *daysNames;
    NSString *strDate;
    NSString *dayName;
    NSString *month;
    NSMutableArray *arrDate;
    NSMutableArray *arrDayName;
    NSMutableArray *arrMonth;
    int currentdate;
    NSString *strYear ;
    NSString *strDocid;
    NSString *strDateWIthYear;
    NSMutableArray *arrSections;
    
}


@end

@implementation HomePageVCViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    strDocid=appdel.objDoctor.strId;
    NSLog(@"%@ ",strDocid);
    
    colDate.bounces=NO;
    tblCLinicDetail.separatorStyle=NO;
    arrDayName=[[NSMutableArray alloc]init];
    arrDate=[[NSMutableArray alloc]init];
    arrMonth = [[NSMutableArray alloc]init];

    
//    NSDate *date = [NSDate date];
//    NSCalendar *gregorian = [NSCalendar currentCalendar];
//    NSDateComponents *dateComponents = [gregorian components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:date];
//    NSInteger day = [dateComponents day];
    for (int i = 0; i < 30; i ++)
    {
        
        NSDate *dt = [self addDays:i toDate:[NSDate date]];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@" dd"];
        strDate = [dateFormat stringFromDate:dt];
        NSLog(@"Dtaestr : %@",strDate);
        [arrDate addObject:strDate];
        NSLog(@"ArrayDate : %@",arrDate);
        
        
        NSDateFormatter *mymonth = [[NSDateFormatter alloc] init] ;
        [mymonth setDateFormat:@"MMMM"];
        month=[mymonth stringFromDate:dt];
        NSLog(@"current month : %@ ",month);
        [arrMonth addObject:month];
        NSLog(@"Current month %@",arrMonth);
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"];
       dayName  = [dateFormatter stringFromDate:dt];
        NSLog(@"dayName : %@",dayName);
        [arrDayName addObject:dayName];
        NSLog(@"arrayday : %@",arrDayName);
        
        
//        int monthNumber = 11;   //November
//        NSDateFormatter *df = [[NSDateFormatter alloc] init];
//        month = [[df monthSymbols] objectAtIndex:(monthNumber-4)];
//        NSLog(@"mnthStr : %@",month);
//        [arrMonth addObject:month];
//        NSLog(@"ArrMonth : %@",arrMonth);
//        if (strDate) {
//            <#statements#>
//        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString *strYr=[arrMonth firstObject];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    strYear = [formatter stringFromDate:[NSDate date]];
    NSLog(@"%@",strYear);
    [formatter setDateFormat:@"MMM"];
    NSDate *aDate = [formatter dateFromString:strYr];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:aDate];
    NSLog(@"Month: %li", (long)[components month]); /* => 7 */
    NSString *strDateSelected=[arrDate firstObject];
    NSLog(@"%@-%ld-%@",strDateSelected,(long)[components month],strYear);
    strDateWIthYear=[NSString stringWithFormat:@"%@-%ld-%@",strDateSelected,(long)[components month],strYear];
    
    [[DoctorClinicDetailService service]callDoctorClinicDetailServiceDocid:strDocid Date:strDateWIthYear withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
     {
         if (isError)
         {
             [self displayErrorWithMessage:strMsg];
         }
         else
         {
             NSLog(@"result %@",result);
             arrSections=(id)result;
             if (arrSections.count==0)
             {
                 [self displayErrorWithMessage:@"You are not available to your patients today"];
             }
             [tblCLinicDetail reloadData];
         }
     }];

}

- (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate
{
        NSDateComponents *components= [[NSDateComponents alloc] init];
        [components setDay:days];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        return [calendar dateByAddingComponents:components toDate:originalDate options:0];
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark IBAction
#pragma mark

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    self.frostedViewController.limitMenuViewSize = YES;
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
    
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


-(void)logoutapp
{

}
#pragma mark -
#pragma mark CollectionView Delegate
#pragma mark


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 30.0f;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *identifier = @"Cell";
    
    [collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    //here we load xib. to our collection view
    [collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:[NSBundle mainBundle]]  forCellWithReuseIdentifier:identifier];
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:25.0f/255.0f green:138.0f/255.0f blue:135.0f/255.0f alpha:1.0];
   // NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomeCollectionViewCell" owner:self options:nil];
    
    
//        DateLessThan30 = [theDate intValue];
//    
//    
//        if(DateLessThan30+indexPath.row<=30)
//        {
//            NSLog(@"indexpath= %ld",DateLessThan30+indexPath.row);
//            cell.lblDate.text=[NSString stringWithFormat:@"%ld",DateLessThan30+indexPath.row];
//            cell.lblDate.textAlignment=NSTextAlignmentCenter;
//            cell.lblDay.text=DayName;
//        }
//    
//        else
//        {
//            NSLog(@"%ld",(long)indexPath.row);
//            NSLog(@"DateLessThan30=%d",DateLessThan30);
//            DateLessThan30=DateLessThan30+(int)(indexPath.row);
//            int currentdate=DateLessThan30%30;
//            
//            cell.lblDate.text=[NSString stringWithFormat:@"%d",currentdate];
//        }
    
    cell.lblDate.textAlignment=NSTextAlignmentCenter;
    cell.lblDate.text=[arrDate objectAtIndex:indexPath.row];
    
    cell.lblDay.textAlignment=NSTextAlignmentCenter;
    cell.lblDay.text=[arrDayName objectAtIndex:indexPath.row];;

//    cell.lblMonth.text=monthName;
    cell.lblMonth.textAlignment=NSTextAlignmentCenter;
    cell.lblMonth.text=[arrMonth objectAtIndex:indexPath.row];

        return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strYr=[arrMonth objectAtIndex:indexPath.row];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM"];
    NSDate *aDate = [formatter dateFromString:strYr];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:aDate];
    NSLog(@"Month: %li", (long)[components month]); /* => 7 */
    NSString *strDateSelected=[arrDate objectAtIndex:indexPath.row];
    NSLog(@"%@-%ld-%@",strDateSelected,(long)[components month],strYear);
    strDateWIthYear=[NSString stringWithFormat:@"%@-%ld-%@",strDateSelected,(long)[components month],strYear];
    
    
    [[DoctorClinicDetailService service]callDoctorClinicDetailServiceDocid:strDocid Date:strDateWIthYear withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg)
     {
         if (isError)
         {
             [self displayErrorWithMessage:strMsg];
         }
         else
         {
             NSLog(@"result %@",result);
             arrSections=(id)result;
             if (arrSections.count==0)
             {
                 [self displayErrorWithMessage:@"You are not available to your patients today"];
             }
             [tblCLinicDetail reloadData];
        }
     }];
    
}

#pragma mark Collection view layout things
// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"SETTING SIZE FOR ITEM AT INDEX %ld", (long)indexPath.row);
    CGSize mElementSize = CGSizeMake(104, 104);
    return mElementSize;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}

#pragma mark
#pragma mark  TableView Delegate
#pragma mark


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    if (arrSections.count>0)
    {
        return arrSections.count;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (arrSections.count>0)
    {
        static NSString *simpleTableIdentifier = @"identifier";
        HomeTableViewCell *cell = (HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
        if (!cell)
        {
            cell = [nib objectAtIndex:1];
        }
        ModelDoctorClinic *obj=[arrSections objectAtIndex:section];
        cell.lblSectionName.text=obj.strClinicName;
        return cell.contentView;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (arrSections.count>0)
    {
        ModelDoctorClinic *obj=[arrSections objectAtIndex:section];
        NSLog(@"%lu",(unsigned long)obj.arrSlots.count);
        return obj.arrSlots.count;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (arrSections.count==0)
    {
        return 80.0f;
    }
    return 170.0f;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (arrSections.count>0)
    {
        static NSString *simpleTableIdentifier = @"SimpleTableItem";
        HomeTableViewCell *cell = (HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
        if (!cell)
        {
            cell = [nib objectAtIndex:0];
        }
        ModelDoctorClinic *obj=[arrSections objectAtIndex:indexPath.section];
        ModelDoctorSlots *objSlots=[[ModelDoctorSlots alloc]initWithDictionary:[obj.arrSlots objectAtIndex:indexPath.row]];
        NSLog(@"%@",objSlots.strPataientCount);
        cell.lblPatientCount.text=[NSString stringWithFormat:@"%@",objSlots.strPataientCount];
        cell.lblTime.text=[NSString stringWithFormat:@"%@%@-%@%@",objSlots.strStartTime,objSlots.strStartMeridian,objSlots.strEndTime,objSlots.strEndMeridian];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        static NSString *simpleTableIdentifier = @"Simple";
        HomeTableViewCell *cell = (HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
        if (!cell)
        {
            cell = [nib objectAtIndex:2];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


@end
