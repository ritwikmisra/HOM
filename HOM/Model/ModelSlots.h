//
//  ModelSlots.h
//  HOM
//
//  Created by AppsbeeTechnology on 09/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelSlots : ModelBaseClass

-(id)initWithDictionary:(NSDictionary*)dict;

@property(nonatomic,weak) NSString *StrDocId;
@property(nonatomic,weak) NSString *strDocType;
@property(nonatomic,weak) NSString *strDocAvaiableDay;
@property(nonatomic,weak) NSString *strDocAvaiableWeek;
@property(nonatomic,weak) NSString *strDocStartTime;
@property(nonatomic,weak) NSString *strDocEndTime;
@property(nonatomic,weak) NSString *strstartMeridian;
@property(nonatomic,weak) NSString *strEndMeridian;
@property(nonatomic,weak) NSString *strDocAvaiableDayName;

@end
