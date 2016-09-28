//
//  borderlabel.h
//  HOM
//
//  Created by AppsbeeTechnology on 12/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface borderlabel : UILabel

{
    CGFloat topInset;
    CGFloat leftInset;
    CGFloat bottomInset;
    CGFloat rightInset;
}

@property (nonatomic) CGFloat topInset;
@property (nonatomic) CGFloat leftInset;
@property (nonatomic) CGFloat bottomInset;
@property (nonatomic) CGFloat rightInset;

@end


