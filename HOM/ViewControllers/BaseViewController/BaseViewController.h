//
//  BaseViewController.h
//  HOM
//
//  Created by AppsbeeTechnology on 08/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

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
