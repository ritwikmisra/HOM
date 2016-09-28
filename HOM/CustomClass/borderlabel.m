//
//  borderlabel.m
//  HOM
//
//  Created by AppsbeeTechnology on 12/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "borderlabel.h"

@implementation borderlabel
{




}
@synthesize topInset, leftInset, bottomInset, rightInset;

-(void)drawTextInRect:(CGRect)rect
{
    
    UIEdgeInsets insets = {self.topInset, 20,
        self.bottomInset, self.rightInset};
    
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}



@end
