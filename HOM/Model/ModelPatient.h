//
//  ModelPatient.h
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelPatient : ModelBaseClass

@property(nonatomic,strong)NSString *strUserFamilyID;
@property(nonatomic,strong)NSString *strUserUniqueID;
@property(nonatomic,strong)NSString *strPatientName;
@property(nonatomic,strong)NSString *strPhone;
@property(nonatomic,strong)NSString *strGender;
@property(nonatomic,strong)NSString *strAge;
@property(nonatomic,strong)NSString *strImage;
@property(nonatomic,strong)NSString *strEmail;
@property(nonatomic,strong)NSString *strAddress;


-(id)initWithDictionary:(NSDictionary *)dict;
@end
