//
//  DemoNavigationVCViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 19/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "DemoNavigationVCViewController.h"

@interface DemoNavigationVCViewController ()

@end

@implementation DemoNavigationVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    
    //self.frostedViewController.limitMenuViewSize = YES;


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

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //

    [self.view endEditing:YES];
       self.frostedViewController.limitMenuViewSize = YES;

    [self.frostedViewController.view endEditing:YES];
//    self.frostedViewController.limitMenuViewSize = YES;

    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}


@end
