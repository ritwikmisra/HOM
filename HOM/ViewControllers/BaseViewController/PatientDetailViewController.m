//
//  PatientDetailViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 29/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "PatientDetailViewController.h"
#import "AboutViewController.h"
#import "PrescriptionViewController.h"
#import "ReportViewController.h"

@interface PatientDetailViewController ()<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>
{
    NSMutableArray *arrControllers;
    
}
@property(nonatomic,weak) IBOutlet UIScrollView *scrlAllPage;
@end

@implementation PatientDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //standard UIScrollView is added
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(40, 20, 300, 200)];
    
    [self.view addSubview:_scrlAllPage];
    
    _scrlAllPage.pagingEnabled = YES;
    _scrlAllPage.contentSize = CGSizeMake(320*2, 460); //this must be the appropriate size!
    
    //required to keep your view controllers around
    arrControllers = [[NSMutableArray alloc] initWithCapacity:0];
    
    //just adding two controllers
   AboutViewController  *one = [[AboutViewController alloc]init] ;
    
    [_scrlAllPage addSubview:one.view];
    [arrControllers addObject:one];
    
    PrescriptionViewController *two = [[PrescriptionViewController alloc]init];
    [_scrlAllPage addSubview:two.view];
    [arrControllers addObject:two];
    
    ReportViewController *three = [[ReportViewController alloc]init];
    [_scrlAllPage addSubview:three.view];
    [arrControllers addObject:three];
    
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

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    
//    self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/2;
//    
//    [self.imgProfilePic.layer setBorderColor: [[UIColor whiteColor] CGColor]];
//    self.imgProfilePic.layer.cornerRadius = 2.0;
//    self.imgProfilePic.layer.borderWidth = 1.0;
//    self.imgProfilePic.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/5;
//    self.imgProfilePic.layer.masksToBounds=YES;
//    // Initialization code
//}

-(void)viewWillLayoutSubviews{
//    self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/2;
//    [self.imgProfilePic setBackgroundColor:[UIColor clearColor]];
//    self.imgProfilePic.layer.cornerRadius = 2.0;
//    self.imgProfilePic.layer.masksToBounds=YES;
//    self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/2;
    
        self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/18;
    
        [self.imgProfilePic.layer setBorderColor: [[UIColor blackColor] CGColor]];
        self.imgProfilePic.layer.cornerRadius = 2.0;
        self.imgProfilePic.layer.borderWidth = 1.0;
        self.imgProfilePic.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/8;
        self.imgProfilePic.layer.masksToBounds=YES;
        // Initialization code

}




@end
