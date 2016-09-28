//
//  ModelDoc.m
//  HOM
//
//  Created by AppsbeeTechnology on 04/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelDoc.h"

@implementation ModelDoc

-(id)initWithDictionary:(NSDictionary*)dict
{
    if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]])
    {
        _strId = [dict objectForKey:@"id"];
    }
    else
    {
        _strId=@"";
    }
    if ([dict objectForKey:@"registration_id"] && ![[dict objectForKey:@"registration_id"] isKindOfClass:[NSNull class]])
    {
        _strRegid= [dict objectForKey:@"registration_id"];
    }
    else
    {
        _strRegid=@"";
    }
   
    
    if ([dict objectForKey:@"prefix"] && ![[dict objectForKey:@"prefix"] isKindOfClass:[NSNull class]])
    {
        _strPrefix = [dict objectForKey:@"prefix"];
        
    }
    else
    {
        _strPrefix=@"";
    }
    if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]])
    {
        _strName= [dict objectForKey:@"name"];
    }
    else
    {
        _strName=@"";
    }
    
    
    if ([dict objectForKey:@"phone"] && ![[dict objectForKey:@"phone"] isKindOfClass:[NSNull class]])
    {
        _strPhone = [dict objectForKey:@"phone"];
    }
    else
    {
        _strPhone=@"";
    }
    if ([dict objectForKey:@"description"] && ![[dict objectForKey:@"description"] isKindOfClass:[NSNull class]])
    {
        _strDescription= [dict objectForKey:@"description"];
        
    }
    else
    {
        _strDescription=@"";
    }
    
    if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]])
    {
        _strEmail = [dict objectForKey:@"email"];
    }
    else
    {
        _strEmail=@"";
    }
    if ([dict objectForKey:@"department_id"] && ![[dict objectForKey:@"department_id"] isKindOfClass:[NSNull class]])
    {
        _strDepertmentid= [dict objectForKey:@"department_id"];
        
    }
    else
    {
        _strDepertmentid=@"";
    }
    
    if ([dict objectForKey:@"degree"] && ![[dict objectForKey:@"degree"] isKindOfClass:[NSNull class]])
    {
        _strDegree = [dict objectForKey:@"degree"];
    }
    else
    {
        _strDegree=@"";
    }
    if ([dict objectForKey:@"speciality"] && ![[dict objectForKey:@"speciality"] isKindOfClass:[NSNull class]])
    {
        _strSpecility = [dict objectForKey:@"speciality"];
    }
    else
    {
        _strSpecility=@"";
    }
    if ([dict objectForKey:@"tag"] && ![[dict objectForKey:@"tag"] isKindOfClass:[NSNull class]])
    {
        _strTag = [dict objectForKey:@"tag"];
    }
    else
    {
        _strTag=@"";
    }
    if ([dict objectForKey:@"doc_image"] && ![[dict objectForKey:@"doc_image"] isKindOfClass:[NSNull class]])
    {
        _strDocimage = [dict objectForKey:@"doc_image"];
        
    }
    else
    {
        _strDocimage=@"";
    }
    if ([dict objectForKey:@"department_name"] && ![[dict objectForKey:@"department_name"] isKindOfClass:[NSNull class]])
    {
        _strDepertmentName = [dict objectForKey:@"department_name"];
    }
    else
    {
        _strDepertmentName=@"";
    }

return self;

}

@end
