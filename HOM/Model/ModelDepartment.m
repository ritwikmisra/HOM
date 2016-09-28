//
//  ModelDepartment.m
//  HOM
//
//  Created by AppsbeeTechnology on 02/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelDepartment.h"

@implementation ModelDepartment


-(id)initWithDictionary:(NSDictionary*)dict
{
    if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]])
    {
        _strDeptId = [dict objectForKey:@"id"];

    }
    else
    {
        _strDeptId=@"";
    }
    if ([dict objectForKey:@"department_name"] && ![[dict objectForKey:@"department_name"] isKindOfClass:[NSNull class]])
    {
        _strDeptName= [dict objectForKey:@"department_name"];

    }
    else
    {
        _strDeptName=@"";
    }
    return self;
}

@end
