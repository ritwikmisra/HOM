//
//  ModelDepartment.h
//  HOM
//
//  Created by AppsbeeTechnology on 02/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelDepartment : ModelBaseClass


@property(nonatomic,strong) NSString *strDeptId;
@property(nonatomic,strong) NSString *strDeptName;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
