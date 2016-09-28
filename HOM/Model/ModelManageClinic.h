//
//  ModelManageClinic.h
//  HOM
//
//  Created by AppsbeeTechnology on 09/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelManageClinic : ModelBaseClass

-(id)initWithDictionary:(NSDictionary*)dict;


@property(nonatomic,weak) NSString *strClinicId;
@property(nonatomic,weak) NSString *strType;
@property(nonatomic,weak) NSString *strClinicname;
@property(nonatomic,weak) NSString *strClinicCategoryid;
@property(nonatomic,weak) NSString *strOwnerId;
@property(nonatomic,weak) NSString *strDocHasPvtClinicId;
@property(nonatomic,strong) NSMutableArray *arrSlots;




@end
