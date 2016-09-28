//
//  DocProfileEditService.h
//  HOM
//
//  Created by AppsbeeTechnology on 31/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DocProfileEditService : WebServiceBaseClass

+(id)service;

-(void)callRegistrationWebserviceWithImage:(NSString *)strimgpic Docid:(NSString *)strid  Name:(NSString *)strFullName Speciality:(NSString *)strSpeciality Depertment:(NSString *)strSelectDep Degree:(NSString *)strDegree Email:(NSString *)strEmail Regid:(NSString *)strRegid Description:(NSString *)strDescription prefix:(NSString *)strprefix  withCompletionHandler:(WebServiceCompletion)handler;

@end
