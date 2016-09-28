//
//  ModelDoctorClinic.m
//  HOM
//
//  Created by appsbeetech on 27/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelDoctorClinic.h"

@implementation ModelDoctorClinic

-(id)initWithDictionary:(NSDictionary *)dict
{
    if (self=[super init])
    {
        if ([dict objectForKey:@"clinic_id"] && ![[dict objectForKey:@"clinic_id"] isKindOfClass:[NSNull class]])
        {
            self.strClinicID = [dict objectForKey:@"clinic_id"];
        }
        else
        {
            self.strClinicID=@"";
        }
        if ([dict objectForKey:@"clinic_name"] && ![[dict objectForKey:@"clinic_name"] isKindOfClass:[NSNull class]])
        {
            self.strClinicName = [dict objectForKey:@"clinic_name"];
        }
        else
        {
            self.strClinicName=@"";
        }
        if ([dict objectForKey:@"slots"] && ![[dict objectForKey:@"slots"] isKindOfClass:[NSNull class]])
        {
            self.arrSlots = [dict objectForKey:@"slots"];
            
        }
        else
        {
            [self.arrSlots addObject:@""];
        }

    }
    return self;
}

@end
