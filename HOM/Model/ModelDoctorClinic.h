//
//  ModelDoctorClinic.h
//  HOM
//
//  Created by appsbeetech on 27/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelDoctorClinic : ModelBaseClass

@property(nonatomic,strong)NSString *strClinicID;
@property(nonatomic,strong)NSString *strClinicName;
@property(nonatomic,strong)NSMutableArray *arrSlots;

-(id)initWithDictionary:(NSDictionary *)dict;
@end
