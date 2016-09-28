//
//  sidePannelDocProfileTableViewCell.h
//  HOM
//
//  Created by AppsbeeTechnology on 26/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sidePannelDocProfileTableViewCell : UITableViewCell


@property(nonatomic,weak)IBOutlet UILabel *lblAll;
@property(nonatomic,weak) IBOutlet UILabel *lblDes;
@property(nonatomic,weak) IBOutlet UITextView *txtdes;
@property (nonatomic,weak) IBOutlet UITextField *txtAll;
@property (nonatomic,weak) IBOutlet UIButton *btnDropDwn;
@property (nonatomic,weak) IBOutlet UILabel *lblclr;
@property (nonatomic,weak) IBOutlet UILabel *lblDepertment;
@property(nonatomic,weak) IBOutlet UITextField *txtDepertment;
@property(nonatomic,weak) IBOutlet UILabel *lblProf;
@property(nonatomic,weak) IBOutlet UILabel *lblDr;

@property(nonatomic,strong)IBOutlet UIButton *btnDoctor;
@property(nonatomic,strong)IBOutlet UIButton *btnProfessor;
@property(nonatomic,strong)IBOutlet UIButton *btnImageUpload;
@property(nonatomic,strong)IBOutlet UIButton *btnEdit;
@property(nonatomic,strong)IBOutlet UIButton *btnSave;


@property(nonatomic,strong)IBOutlet UIImageView *imgDoc;
@property(nonatomic,strong)IBOutlet UIImageView *imgProf;


@property (nonatomic,weak) IBOutlet UIButton *btnSubmit;
@property (nonatomic,weak) IBOutlet UIImageView  *imgProfile;

@property (nonatomic,weak) IBOutlet NSLayoutConstraint  *constWidth;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint  *constHt;

@end
