//
//  ModelDoctorSlots.h
//  HOM
//
//  Created by appsbeetech on 27/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelDoctorSlots : ModelBaseClass

@property(nonatomic,strong)NSString *strID;
@property(nonatomic,strong)NSString *strDocID;
@property(nonatomic,strong)NSString *strClinicID;
@property(nonatomic,strong)NSString *strAvgTimeVisit;
@property(nonatomic,strong)NSString *strMaxPatient;
@property(nonatomic,strong)NSString *strFees	;
@property(nonatomic,strong)NSString *strType	;
@property(nonatomic,strong)NSString *strAvailableDay;
@property(nonatomic,strong)NSString *strAvailableWeek;
@property(nonatomic,strong)NSString *strStartTime;
@property(nonatomic,strong)NSString *strEndTime;
@property(nonatomic,strong)NSString *strStartMeridian;
@property(nonatomic,strong)NSString *strEndMeridian;
@property(nonatomic,strong)NSString *strDocVisitType;
@property(nonatomic,strong)NSString *strActualMaxPatient;
@property(nonatomic,strong)NSString *strCreatedDate;
@property(nonatomic,strong)NSString *strPataientCount;
@property(nonatomic,strong)NSString *strDocSentMsg;
@property(nonatomic,strong)NSString *strStatusMsg;
@property(nonatomic,strong)NSString *strDocStatusID;
@property(nonatomic,strong)NSString *strDocAvailibilityStatus;

-(id)initWithDictionary:(NSDictionary *)dict;






@end
