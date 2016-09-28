//
//  ModelManageClinic.m
//  HOM
//
//  Created by AppsbeeTechnology on 09/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelManageClinic.h"
#import "ModelSlots.h"

@implementation ModelManageClinic

-(id)initWithDictionary:(NSDictionary*)dict
{
    if ([dict objectForKey:@"clinic_id"] && ![[dict objectForKey:@"clinic_id"] isKindOfClass:[NSNull class]])
    {
        _strClinicId = [dict objectForKey:@"clinic_id"];
    }
    else
    {
        _strClinicId=@"";
    }
    
    if ([dict objectForKey:@"type"] && ![[dict objectForKey:@"type"] isKindOfClass:[NSNull class]])
    {
        _strType = [dict objectForKey:@"type"];
    }
    else
    {
        _strType=@"";
    }
    
    if ([dict objectForKey:@"clinic_name"] && ![[dict objectForKey:@"clinic_name"] isKindOfClass:[NSNull class]])
    {
        _strClinicname = [dict objectForKey:@"clinic_name"];
    }
    else
    {
        _strClinicname=@"";
    }
    
    if ([dict objectForKey:@"clinic_category_id"] && ![[dict objectForKey:@"clinic_category_id"] isKindOfClass:[NSNull class]])
    {
        _strClinicCategoryid = [dict objectForKey:@"clinic_category_id"];
    }
    else
    {
        _strClinicCategoryid=@"";
    }

    if ([dict objectForKey:@"owner_id"] && ![[dict objectForKey:@"owner_id"] isKindOfClass:[NSNull class]])
    {
        _strOwnerId = [dict objectForKey:@"owner_id"];
    }
    else
    {
        _strOwnerId=@"";
    }
    if ([dict objectForKey:@"dochasPrivateClinic"] && ![[dict objectForKey:@"dochasPrivateClinic"] isKindOfClass:[NSNull class]])
    {
        _strDocHasPvtClinicId = [dict objectForKey:@"dochasPrivateClinic"];
    }
    else
    {
        _strDocHasPvtClinicId=@"";
    }

    if ([dict objectForKey:@"slots"] && ![[dict objectForKey:@"slots"] isKindOfClass:[NSNull class]])
    {
        NSArray *arrAllSlots = [dict objectForKey:@"slots"];
        _arrSlots=[NSMutableArray array];
        for(int i=0;i<arrAllSlots.count;i++)
        {
            ModelSlots *slot = [[ModelSlots alloc]initWithDictionary:[arrAllSlots objectAtIndex:i]];
            [_arrSlots addObject:slot];
           
        }
    }
       
    return self;
}

@end
