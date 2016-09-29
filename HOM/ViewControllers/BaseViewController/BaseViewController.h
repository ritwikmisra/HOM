//
//  BaseViewController.h
//  HOM
//
//  Created by AppsbeeTechnology on 08/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//
#define LOCAL_URL_IMAGE_UPLOAD @"http://192.168.0.157/uploadImage/doctor_image/"
#define UP_URL_IMAGE_UPLOAD @"http://pro.healthonmobile.in//uploadImage/doctor_image/"

#import <UIKit/UIKit.h>
#include "AppDelegate.h"

@interface BaseViewController : UIViewController
{
    @protected
    AppDelegate *appdel;
}

-(id)getSuperviewOfType:(id)superview fromView:(id)myView;
-(void)displayErrorWithMessage:(NSString*)strMsg;
- (void)setNavigationController;
-(BOOL)isValidEmail:(NSString*)strEmailID;
@property (nonatomic) int myIntVariable;



@end
