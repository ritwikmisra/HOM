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
#import "UpdateDocAvailibilityStatusService.h"
#import "UpdateDocAvailibilityStatusService.h"

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
    NSMutableArray *arrMonth,*arrClinicID,*arrSlotID;
    int currentdate;
    NSString *strYear ;
    NSString *strDocid;
    NSString *strDateWIthYear; //booking date
    NSMutableArray *arrSections;
    NSString *strDeatilDelay;
    NSString *strclinicID,*strSlotID;
    NSString *strMessage,*strStatus;
    int counter;
    NSString *strRow;
}


@end

@implementation HomePageVCViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    counter=0;
    strDocid=appdel.objDoctor.strId;
    
    NSLog(@"%@ ",strDocid);
    arrClinicID=[[NSMutableArray alloc]init];
    arrSlotID=[[NSMutableArray alloc]init];

    colDate.bounces=NO;
    tblCLinicDetail.separatorStyle=NO;
    arrDayName=[[NSMutableArray alloc]init];
    arrDate=[[NSMutableArray alloc]init];
    arrMonth = [[NSMutableArray alloc]init];
    tblCLinicDetail.backgroundColor=[UIColor clearColor];
    
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
    [self callWebService];

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


-(void)btnStatusClick:(id)sender
{
    strclinicID=[arrClinicID objectAtIndex:[sender tag]];
    strSlotID=[arrSlotID objectAtIndex:[sender tag]];
    NSLog(@"%@,%@",strclinicID,strSlotID);
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Place your status" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionIN=[UIAlertAction actionWithTitle:@"IN" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
            
        }];
        strStatus=[NSString stringWithFormat:@"%d",1];
        strMessage=@"";
        [self callWebServiceWithStatus:strStatus message:strMessage];
        
    }];
    
    UIAlertAction *actionOUT=[UIAlertAction actionWithTitle:@"OUT" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
            
        }];
        strMessage=@"";
        strStatus=[NSString stringWithFormat:@"%d",2];
        [self callWebServiceWithStatus:strStatus message:strMessage];


    }];
    UIAlertAction *actionDelayed=[UIAlertAction actionWithTitle:@"DELAYED" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{

            
        }];
        [self showDelayPopUP];
    }];
    UIAlertAction *actionCancelled=[UIAlertAction actionWithTitle:@"CANCELED" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [alertController dismissViewControllerAnimated:YES completion:^{
            
            
        }];
        strMessage=@"";
        strStatus=[NSString stringWithFormat:@"%d",5];
         [self callWebServiceWithStatus:strStatus message:strMessage];

    }];
    [alertController addAction:actionIN];
    [alertController addAction:actionOUT];
    [alertController addAction:actionDelayed];
    [alertController addAction:actionCancelled];
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

-(void)btnTotalPatientClick:(id)sender
{
    
    
}

-(void)btnTimeclick:(id)sender
{
    
    
}

-(void)btnReloadclick:(id)sender
{
    [tblCLinicDetail beginUpdates];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSArray *indexPathArr = [[NSArray alloc]initWithObjects:indexPath, nil];
    [tblCLinicDetail reloadRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationNone];
    [tblCLinicDetail endUpdates];
    [self callWebService];
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
    [self callWebService];
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
        
        [cell.btnReload addTarget:self action:@selector(btnReloadclick:) forControlEvents:UIControlEventTouchUpInside];
        
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
        strRow=[NSString stringWithFormat:@"%lu", (unsigned long)obj.arrSlots.count];

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
        cell.btnStatus.tag=counter;
        [cell.btnStatus addTarget:self action:@selector(btnStatusClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.btnTotalPatient addTarget:self action:@selector(btnTotalPatientClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.btnTime addTarget:self action:@selector(btnTimeclick:) forControlEvents:UIControlEventTouchUpInside];
        
        NSLog(@"%@",objSlots.strPataientCount);
        [arrSlotID addObject:objSlots.strID];
        [arrClinicID addObject:obj.strClinicID];
        cell.lblPatientCount.text=[NSString stringWithFormat:@"%@",objSlots.strPataientCount];
        cell.lblTime.text=[NSString stringWithFormat:@"%@%@-%@%@",objSlots.strStartTime,objSlots.strStartMeridian,objSlots.strEndTime,objSlots.strEndMeridian];
        if ([objSlots.strDocAvailibilityStatus isEqualToString:@"Delayed"])
        {
            cell.lblStatus.text=[NSString stringWithFormat:@"%@-%@",objSlots.strDocAvailibilityStatus,objSlots.strStatusMsg];
        }
        else
        {
            cell.lblStatus.text=[NSString stringWithFormat:@"%@",objSlots.strDocAvailibilityStatus];

        }
        
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        counter++;
        cell.backgroundColor=[UIColor clearColor];
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
        cell.backgroundColor=[UIColor clearColor];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

#pragma mark
#pragma mark show popup
#pragma mark

-(void)showDelayPopUP
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"How much time?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action10mins=[UIAlertAction actionWithTitle:@"10 Mins" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       [alertController dismissViewControllerAnimated:YES completion:^{
         
       }];
        
        strMessage=@"10 Mins";
        strStatus=[NSString stringWithFormat:@"%d",4];
        [self callWebServiceWithStatus:strStatus message:strMessage];

    }];
    
    UIAlertAction *action20mins=[UIAlertAction actionWithTitle:@"20 Mins" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            

        }];
        
        strMessage=@"20 Mins";
        strStatus=[NSString stringWithFormat:@"%d",4];
        [self callWebServiceWithStatus:strStatus message:strMessage];
    }];
    
    UIAlertAction *action30mins=[UIAlertAction actionWithTitle:@"30 Mins" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        strMessage=@"30 Mins";
        strStatus=[NSString stringWithFormat:@"%d",4];
        [self callWebServiceWithStatus:strStatus message:strMessage];
    }];
    UIAlertAction *action45mins=[UIAlertAction actionWithTitle:@"45 Mins" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
            
        }];
        
        strMessage=@"45 Mins";
        strStatus=[NSString stringWithFormat:@"%d",4];
        [self callWebServiceWithStatus:strStatus message:strMessage];
    }];
    UIAlertAction *action1Hour=[UIAlertAction actionWithTitle:@"1Hr" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        strMessage=@"1Hr";
        strStatus=[NSString stringWithFormat:@"%d",4];
        [self callWebServiceWithStatus:strStatus message:strMessage];
    }];
    UIAlertAction *action1hr30min=[UIAlertAction actionWithTitle:@"1:30Hr" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
            
        }];
        strMessage=@"1:30Hr";
        strStatus=[NSString stringWithFormat:@"%d",4];
        [self callWebServiceWithStatus:strStatus message:strMessage];
    }];
    
    UIAlertAction *action2hr=[UIAlertAction actionWithTitle:@"2Hr" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            
        }];
        strMessage=@"2Hr";
        strStatus=[NSString stringWithFormat:@"%d",4];
        [self callWebServiceWithStatus:strStatus message:strMessage];
    }];
    
    UIAlertAction *Cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            

        }];
    }];
    [alertController addAction:action10mins];
    [alertController addAction:action20mins];
    [alertController addAction:action30mins];
    [alertController addAction:action45mins];
    [alertController addAction:action1Hour];
    [alertController addAction:action1hr30min];
    [alertController addAction:action2hr];
    [alertController addAction:Cancel];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

#pragma mark
#pragma mark webservice
#pragma mark

-(void)callWebServiceWithStatus:(NSString *)strStatus1 message:(NSString *)strMessage1
{
    NSLog(@"%@ %@ %@ %@",strStatus1,strMessage1,strSlotID,strclinicID);
    
    [[UpdateDocAvailibilityStatusService service]callUpdateDocAvailibilityStatusServiceDocid:strDocid DocClinicID:strclinicID Slot:strSlotID BookingDate:strDateWIthYear DocStatusID:strStatus1 DocStatusMsg:strMessage1 withCompletionHandler:^(id  _Nullable result, BOOL isError, NSString * _Nullable strMsg) {
        if (isError)
        {
            [self displayErrorWithMessage:strMessage];
        }
        else
        {
            NSLog(@"%@",result);
            [self callWebService];
        }
    }];
    
}

-(void)callWebService
{
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
             [arrSlotID removeAllObjects];
             [arrClinicID removeAllObjects];
             counter=0;
             [tblCLinicDetail reloadData];
         }
     }];
}





@end
