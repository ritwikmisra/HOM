//
//  DoctorClinicDetailService.h
//  HOM
//
//  Created by appsbeetech on 27/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DoctorClinicDetailService : WebServiceBaseClass

+(id)service;

-(void)callDoctorClinicDetailServiceDocid:(NSString *)strDocid  Date:(NSString *)strDate  withCompletionHandler:(WebServiceCompletion)handler;


@end
