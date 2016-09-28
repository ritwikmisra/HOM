//
//  RegisterPvtClinicService.h
//  HOM
//
//  Created by AppsbeeTechnology on 12/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface RegisterPvtClinicService : WebServiceBaseClass

+(id)service;

-(void)callRegisterPvtClinicWebservicewithClinicName:(NSString *)StrClinicName phno:(NSString *)strPhno address:(NSString *)strAddress Docid:(NSString *)strdocid Clinicid:(NSString *)strClinicId detailArray:(NSArray *)arrJason  withCompletionHandler:(WebServiceCompletion)handler;


@end
