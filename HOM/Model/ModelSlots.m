//
//  ModelSlots.m
//  HOM
//
//  Created by AppsbeeTechnology on 09/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelSlots.h"

@implementation ModelSlots

-(id)initWithDictionary:(NSDictionary*)dict
{

    if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]])
    {
            _StrDocId = [dict objectForKey:@"id"];
    }
    else
    {
            _StrDocId=@"";
    }

    if ([dict objectForKey:@"type"] && ![[dict objectForKey:@"type"] isKindOfClass:[NSNull class]])
    {
        _strDocType = [dict objectForKey:@"type"];
    }
    else
    {
        _strDocType=@"";
    }

    if ([dict objectForKey:@"available_day"] && ![[dict objectForKey:@"available_day"] isKindOfClass:[NSNull class]])
    {
        _strDocAvaiableDay = [dict objectForKey:@"available_day"];
    }
    else
    {
        _strDocAvaiableDay=@"";
    }
    if ([dict objectForKey:@"available_week"] && ![[dict objectForKey:@"available_week"] isKindOfClass:[NSNull class]])
    {
        _strDocAvaiableWeek = [dict objectForKey:@"available_week"];
    }
    else
    {
        _strDocAvaiableWeek=@"";
    }
    if ([dict objectForKey:@"start_time"] && ![[dict objectForKey:@"start_time"] isKindOfClass:[NSNull class]])
    {
        _strDocStartTime = [dict objectForKey:@"start_time"];
    }
    else
    {
        _strDocStartTime=@"";
    }

    if ([dict objectForKey:@"end_time"] && ![[dict objectForKey:@"end_time"] isKindOfClass:[NSNull class]])
    {
        _strDocEndTime = [dict objectForKey:@"end_time"];
    }
    else
    {
        _strDocEndTime=@"";
    }

    if ([dict objectForKey:@"start_meridian"] && ![[dict objectForKey:@"start_meridian"] isKindOfClass:[NSNull class]])
    {
        _strstartMeridian = [dict objectForKey:@"start_meridian"];
    }
    else
    {
        _strstartMeridian=@"";
    }
    
    if ([dict objectForKey:@"end_meridian"] && ![[dict objectForKey:@"end_meridian"] isKindOfClass:[NSNull class]])
    {
        _strEndMeridian = [dict objectForKey:@"end_meridian"];
    }
    else
    {
        _strEndMeridian=@"";
    }

    if ([dict objectForKey:@"available_day_name"] && ![[dict objectForKey:@"available_day_name"] isKindOfClass:[NSNull class]])
    {
        _strDocAvaiableDayName = [dict objectForKey:@"available_day_name"];
    }
    else
    {
        _strDocAvaiableDayName=@"";
    }

    return self;
}
@end
