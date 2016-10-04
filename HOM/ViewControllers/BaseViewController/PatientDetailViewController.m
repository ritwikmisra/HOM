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
#import "UIImageView+WebCache.h"



@interface PatientDetailViewController ()<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>
{
    NSMutableArray *arrControllers;
//    
}
@property(nonatomic,weak) IBOutlet UIView *vwAbout;
@property(nonatomic,weak) IBOutlet UIView *vwPrescription;
@property(nonatomic,weak) IBOutlet UIView *vwReport;
@property(nonatomic,weak) IBOutlet UIScrollView *scrlAllPage;
@property(nonatomic,weak)  UIButton *btnAbout;
@property(nonatomic,weak)  UIButton *btnPrescription;
@property(nonatomic,weak)  UIButton *btnReport;

@end
@implementation PatientDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *strurl = [UP_URL_IMAGE_UPLOAD stringByAppendingString: appdel.objDoctor.strDocimage];
    
    [_imgProfilePic sd_setImageWithURL:[NSURL URLWithString:strurl] placeholderImage:[UIImage imageNamed:@"image_preview.png"]];
    
    self.vwAbout.backgroundColor = [UIColor orangeColor];
    [self.btnAbout setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];

    //[self.storyboard instantiateViewControllerWithIdentifier:@"About"];
      [self.view addSubview:_scrlAllPage];
    
    _scrlAllPage.pagingEnabled = YES;
    _scrlAllPage.contentSize = CGSizeMake(self.view.frame.size.width*3,self.view.frame.size.height/1.8); //this must be the appropriate size!

    AboutViewController *AboutViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"About"];
    
    
    AboutViewController.view.frame = CGRectMake(0, 0, 600, 344);

    
    [self addChildViewController:AboutViewController];
    
    [self.scrlAllPage addSubview:AboutViewController.view];
    
    [AboutViewController didMoveToParentViewController:self];
    
    
    PrescriptionViewController *PrescriptionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Prescription"];
    
    PrescriptionViewController.view.frame = CGRectMake(320, 0, 600, 344);
    
    
    [self addChildViewController:PrescriptionViewController];
    
    [self.scrlAllPage addSubview:PrescriptionViewController.view];
    
    [PrescriptionViewController didMoveToParentViewController:self];
    

    ReportViewController *ReportViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Report"];
    
    ReportViewController.view.frame = CGRectMake(640, 0, 600, 344);
    
    
    [self addChildViewController:ReportViewController];
    
    [self.scrlAllPage addSubview:ReportViewController.view];
    
    [ReportViewController didMoveToParentViewController:self];
    
    
//    PrescriptionViewController *PrescriptionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Prescription"];
//    
//    CGRect frame = PrescriptionViewController.view.frame;
//    
//    frame.origin.x = 120;
//    
//    PrescriptionViewController.view.frame = CGRectMake(120, 0, 600, 200);
//    
//    
//    
//    [self addChildViewController:PrescriptionViewController];
//    
//    [self.scrlAllPage addSubview:PrescriptionViewController.view];
//    
//    [PrescriptionViewController didMoveToParentViewController:self];
//    
    
    
  //  self.scrlAllPage.contentSize = CGSizeMake(640, self.view.frame.size.height/2);
    
   // self.scrlAllPage.pagingEnabled = YES;
    
    
    
//    ReportViewController *ReportViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Report"];
//    
//    CGRect frame1 = ReportViewController.view.frame;
//    
//    frame1.origin.x = 640;
//    
//    ReportViewController.view.frame = frame1;
//    
//    
//    
//    [self addChildViewController:ReportViewController];
//    
//    [self.scrlAllPage addSubview:ReportViewController.view];
//    
//    [ReportViewController didMoveToParentViewController:self];
    
    
    
  // self.scrlAllPage.contentSize = CGSizeMake(600, 344);
    
   // self.scrlAllPage.pagingEnabled = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
    
        self.constWidth.constant = [UIScreen mainScreen].bounds.size.height/18;
    
        [self.imgProfilePic.layer setBorderColor: [[UIColor whiteColor] CGColor]];
        self.imgProfilePic.layer.cornerRadius = 2.0;
        self.imgProfilePic.layer.borderWidth = 1.0;
        self.imgProfilePic.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/8;
        self.imgProfilePic.layer.masksToBounds=YES;
        // Initialization code

}

#pragma mark
#pragma mark Ibaction
#pragma mark

-(IBAction)btnAbout:(id)sender
{
    UIButton *buttonSender = (UIButton *)sender;
    
    [self.btnAbout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btnAbout = buttonSender;
    [self.btnAbout setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.btnPrescription setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnReport setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.vwAbout.backgroundColor = [UIColor orangeColor];
    self.vwPrescription.backgroundColor = [UIColor clearColor];
    self.vwReport.backgroundColor = [UIColor clearColor];
    
    [_scrlAllPage setContentOffset:CGPointMake(0, 0) animated:YES];
}
-(IBAction)btnPrescription:(id)sender
{
    UIButton *buttonSender = (UIButton *)sender;
    
    [self.btnPrescription setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btnPrescription = buttonSender;
    [self.btnPrescription setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.btnReport setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnAbout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.vwPrescription.backgroundColor = [UIColor orangeColor];
    self.vwAbout.backgroundColor = [UIColor clearColor];
    self.vwReport.backgroundColor = [UIColor clearColor];
    
    [_scrlAllPage setContentOffset:CGPointMake(320, 0) animated:YES];

}
-(IBAction)btnReport:(id)sender
{
    UIButton *buttonSender = (UIButton *)sender;
    
    [self.btnReport setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btnReport = buttonSender;
    [self.btnReport setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.btnAbout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnPrescription setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    self.vwReport.backgroundColor = [UIColor orangeColor];
    self.vwPrescription.backgroundColor = [UIColor clearColor];
    self.vwAbout.backgroundColor = [UIColor clearColor];
    
    [_scrlAllPage setContentOffset:CGPointMake(640, 0) animated:YES];

}

-(IBAction)BackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
