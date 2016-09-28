//
//  ModelDoctorSlots.m
//  HOM
//
//  Created by appsbeetech on 27/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelDoctorSlots.h"

@implementation ModelDoctorSlots

-(id)initWithDictionary:(NSDictionary*)dict
{
    
    if ([dict objectForKey:@"id"] && ![[dict objectForKey:@"id"] isKindOfClass:[NSNull class]])
    {
       self.strID = [dict objectForKey:@"id"];
    }
    else
    {
        self.strID=@"";
    }
    
    if ([dict objectForKey:@"doctor_id"] && ![[dict objectForKey:@"doctor_id"] isKindOfClass:[NSNull class]])
    {
        self.strDocID = [dict objectForKey:@"doctor_id"];
    }
    else
    {
        self.strDocID=@"";
    }

    if ([dict objectForKey:@"clinic_id"] && ![[dict objectForKey:@"clinic_id"] isKindOfClass:[NSNull class]])
    {
        self.strClinicID = [dict objectForKey:@"clinic_id"];
    }
    else
    {
        self.strClinicID=@"";
    }

    if ([dict objectForKey:@"avg_visit_time"] && ![[dict objectForKey:@"avg_visit_time"] isKindOfClass:[NSNull class]])
    {
        self.strAvgTimeVisit = [dict objectForKey:@"avg_visit_time"];
    }
    else
    {
        self.strAvgTimeVisit=@"";
    }

    
    if ([dict objectForKey:@"max_patient"] && ![[dict objectForKey:@"max_patient"] isKindOfClass:[NSNull class]])
    {
        self.strMaxPatient = [dict objectForKey:@"max_patient"];
    }
    else
    {
        self.strMaxPatient=@"";
    }
    
    
    if ([dict objectForKey:@"fees"] && ![[dict objectForKey:@"fees"] isKindOfClass:[NSNull class]])
    {
        self.strFees = [dict objectForKey:@"fees"];
    }
    else
    {
        self.strFees=@"";
    }

    
    if ([dict objectForKey:@"type"] && ![[dict objectForKey:@"type"] isKindOfClass:[NSNull class]])
    {
        self. strType= [dict objectForKey:@"type"];
    }
    else
    {
        self.strType=@"";
    }
    
    if ([dict objectForKey:@"available_day"] && ![[dict objectForKey:@"available_day"] isKindOfClass:[NSNull class]])
    {
        self. strAvailableDay= [dict objectForKey:@"available_day"];
    }
    else
    {
        self.strAvailableDay=@"";
    }

    if ([dict objectForKey:@"available_week"] && ![[dict objectForKey:@"available_week"] isKindOfClass:[NSNull class]])
    {
        self. strAvailableWeek= [dict objectForKey:@"available_week"];
    }
    else
    {
        self.strAvailableWeek=@"";
    }

    if ([dict objectForKey:@"start_time"] && ![[dict objectForKey:@"start_time"] isKindOfClass:[NSNull class]])
    {
        self. strStartTime= [dict objectForKey:@"start_time"];
    }
    else
    {
        self.strStartTime=@"";
    }
    
    if ([dict objectForKey:@"end_time"] && ![[dict objectForKey:@"end_time"] isKindOfClass:[NSNull class]])
    {
        self. strEndTime= [dict objectForKey:@"end_time"];
    }
    else
    {
        self.strEndTime=@"";
    }
    
    if ([dict objectForKey:@"start_meridian"] && ![[dict objectForKey:@"start_meridian"] isKindOfClass:[NSNull class]])
    {
        self. strStartMeridian= [dict objectForKey:@"start_meridian"];
    }
    else
    {
        self.strStartMeridian=@"";
    }
    
    if ([dict objectForKey:@"end_meridian"] && ![[dict objectForKey:@"end_meridian"] isKindOfClass:[NSNull class]])
    {
        self. strEndMeridian= [dict objectForKey:@"end_meridian"];
    }
    else
    {
        self.strEndMeridian=@"";
    }
    
    if ([dict objectForKey:@"doctor_visit_type"] && ![[dict objectForKey:@"doctor_visit_type"] isKindOfClass:[NSNull class]])
    {
        self. strDocVisitType= [dict objectForKey:@"doctor_visit_type"];
    }
    else
    {
        self.strDocVisitType=@"";
    }
    
    if ([dict objectForKey:@"actual_max_patient"] && ![[dict objectForKey:@"actual_max_patient"] isKindOfClass:[NSNull class]])
    {
        self. strActualMaxPatient= [dict objectForKey:@"actual_max_patient"];
    }
    else
    {
        self.strActualMaxPatient=@"";
    }
    
    if ([dict objectForKey:@"created_date"] && ![[dict objectForKey:@"created_date"] isKindOfClass:[NSNull class]])
    {
        self. strCreatedDate= [dict objectForKey:@"created_date"];
    }
    else
    {
        self.strCreatedDate=@"";
    }
    if ([dict objectForKey:@"patient_count"] && ![[dict objectForKey:@"patient_count"] isKindOfClass:[NSNull class]])
    {
        self. strPataientCount= [dict objectForKey:@"patient_count"];
    }
    else
    {
        self.strPataientCount=@"";
    }
    if ([dict objectForKey:@"doctor_sent_msg"] && ![[dict objectForKey:@"doctor_sent_msg"] isKindOfClass:[NSNull class]])
    {
        self. strDocSentMsg= [dict objectForKey:@"doctor_sent_msg"];
    }
    else
    {
        self.strDocSentMsg=@"";
    }
    
    if ([dict objectForKey:@"status_message"] && ![[dict objectForKey:@"status_message"] isKindOfClass:[NSNull class]])
    {
        self. strStatusMsg= [dict objectForKey:@"status_message"];
    }
    else
    {
        self.strStatusMsg=@"";
    }

    if ([dict objectForKey:@"doc_status_id"] && ![[dict objectForKey:@"doc_status_id"] isKindOfClass:[NSNull class]])
    {
        self. strDocStatusID= [dict objectForKey:@"doc_status_id"];
    }
    else
    {
        self.strDocStatusID=@"";
    }
    
    if ([dict objectForKey:@"doctor_availability_status"] && ![[dict objectForKey:@"doctor_availability_status"] isKindOfClass:[NSNull class]])
    {
        self. strDocAvailibilityStatus= [dict objectForKey:@"doctor_availability_status"];
    }
    else
    {
        self.strDocAvailibilityStatus=@"";
    }
    return self;
}


@end
