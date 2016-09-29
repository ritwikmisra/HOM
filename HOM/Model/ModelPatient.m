//
//  ModelPatient.m
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelPatient.h"

@implementation ModelPatient

-(id)initWithDictionary:(NSDictionary *)dict
{
    if (self=[super init])
    {
        if ([dict objectForKey:@"user_family_id"] && ![[dict objectForKey:@"user_family_id"] isKindOfClass:[NSNull class]])
        {
            _strUserFamilyID = [dict objectForKey:@"user_family_id"];
        }
        else
        {
            _strUserFamilyID=@"";
        }
        if ([dict objectForKey:@"user_unique_id"] && ![[dict objectForKey:@"user_unique_id"] isKindOfClass:[NSNull class]])
        {
            _strUserUniqueID = [dict objectForKey:@"user_unique_id"];
        }
        else
        {
            _strUserUniqueID=@"";
        }
        if ([dict objectForKey:@"patient_name"] && ![[dict objectForKey:@"patient_name"] isKindOfClass:[NSNull class]])
        {
            _strPatientName = [dict objectForKey:@"patient_name"];
        }
        else
        {
            _strPatientName=@"";
        }
        if ([dict objectForKey:@"phone"] && ![[dict objectForKey:@"phone"] isKindOfClass:[NSNull class]])
        {
            _strPhone = [dict objectForKey:@"phone"];
        }
        else
        {
            _strPhone=@"";
        }
        if ([dict objectForKey:@"gender"] && ![[dict objectForKey:@"gender"] isKindOfClass:[NSNull class]])
        {
            _strGender = [dict objectForKey:@"gender"];
        }
        else
        {
            _strGender=@"";
        }
        if ([dict objectForKey:@"age"] && ![[dict objectForKey:@"age"] isKindOfClass:[NSNull class]])
        {
            _strAge = [dict objectForKey:@"age"];
        }
        else
        {
            _strAge=@"";
        }
        if ([dict objectForKey:@"image"] && ![[dict objectForKey:@"image"] isKindOfClass:[NSNull class]])
        {
            _strImage = [dict objectForKey:@"image"];
        }
        else
        {
            _strImage=@"";
        }
        if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]])
        {
            _strEmail = [dict objectForKey:@"email"];
        }
        else
        {
            _strEmail=@"";
        }
        if ([dict objectForKey:@"address"] && ![[dict objectForKey:@"address"] isKindOfClass:[NSNull class]])
        {
            _strAddress = [dict objectForKey:@"address"];
        }
        else
        {
            _strAddress=@"";
        }
    }
    return self;
    
}

@end
