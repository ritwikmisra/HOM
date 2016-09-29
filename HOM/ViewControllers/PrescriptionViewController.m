//
//  PrescriptionViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 29/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "PrescriptionViewController.h"

@interface PrescriptionViewController ()
{
    NSInteger myPosition;
}
@end

@implementation PrescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(320*myPosition, 0, 320, 460)];
    self.view = view;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 320, 50)];
    label.text = @"Hey2!";
    
    [self.view addSubview:label];

}

- (id)initWithPosition:(NSInteger)position text:(NSString*)text
{
    if (self = [super init])
    {
        myPosition = position;
    }
    return self;
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

@end
