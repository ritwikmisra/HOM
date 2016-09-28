//
//  ProfileEditModel.m
//  HOM
//
//  Created by AppsbeeTechnology on 31/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ProfileEditModel.h"

@implementation ProfileEditModel


-(id)initWithDictionary:(NSDictionary*)dict
{
    
    if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]])
    {
        _strEditId = [dict objectForKey:@"id"];
    }
    else
    {
        _strEditId=@"";
    }
    if ([dict objectForKey:@"registration_id"] && ![[dict objectForKey:@"registration_id"] isKindOfClass:[NSNull class]])
    {
        _strEditRegno = [dict objectForKey:@"registration_id"];
    }
    else
    {
        _strEditRegno=@"";
    }
    
    if ([dict objectForKey:@"prefix"] && ![[dict objectForKey:@"prefix"] isKindOfClass:[NSNull class]])
    {
        _strEditPrefix = [dict objectForKey:@"prefix"];
    }
    else
    {
        _strEditPrefix=@"";
    }
    
    if ([dict objectForKey:@"name"] && ![[dict objectForKey:@"name"] isKindOfClass:[NSNull class]])
    {
        _strEditName = [dict objectForKey:@"name"];
    }
    else
    {
        _strEditName=@"";
    }
    
    if ([dict objectForKey:@"phone"] && ![[dict objectForKey:@"phone"] isKindOfClass:[NSNull class]])
    {
        _strphno = [dict objectForKey:@"phone"];
    }
    else
    {
        _strphno=@"";
    }


    if ([dict objectForKey:@"description"] && ![[dict objectForKey:@"description"] isKindOfClass:[NSNull class]])
    {
        _strEditDescription = [dict objectForKey:@"description"];
    }
    else
    {
        _strEditDescription=@"";
    }
    
    if ([dict objectForKey:@"email"] && ![[dict objectForKey:@"email"] isKindOfClass:[NSNull class]])
    {
        _strEditEmail = [dict objectForKey:@"email"];
    }
    else
    {
        _strEditEmail=@"";
    }

    if ([dict objectForKey:@"dept_id"] && ![[dict objectForKey:@"dept_id"] isKindOfClass:[NSNull class]])
    {
        _strEditDepertmentid = [dict objectForKey:@"dept_id"];
    }
    else
    {
        _strEditDepertmentid=@"";
    }

    if ([dict objectForKey:@"degree"] && ![[dict objectForKey:@"degree"] isKindOfClass:[NSNull class]])
    {
        _strEditDegree = [dict objectForKey:@"degree"];
    }
    else
    {
        _strEditDegree=@"";
    }
    
    if ([dict objectForKey:@"doc_image"] && ![[dict objectForKey:@"doc_image"] isKindOfClass:[NSNull class]])
    {
        _strEditDocimage = [dict objectForKey:@"doc_image"];
    }
    else
    {
        _strEditDocimage=@"";
    }
    if ([dict objectForKey:@"speciality"] && ![[dict objectForKey:@"speciality"] isKindOfClass:[NSNull class]])
    {
        _strSpecility=[dict objectForKey:@"speciality"];
    }else
    {
        _strSpecility=@"";
    }
    if ([dict objectForKey:@"department_name"] && ![[dict objectForKey:@"department_name"] isKindOfClass:[NSNull class]])
    {
        _strDepName=[dict objectForKey:@"department_name"];
    }else
    {
        _strDepName=@"";
    }
    if ([dict objectForKey:@"status"] && ![[dict objectForKey:@"status"] isKindOfClass:[NSNull class]])
    {
        _strstatus=[dict objectForKey:@"status"];
    }else
    {
        _strstatus=@"";
    }
    return self;
}
@end
