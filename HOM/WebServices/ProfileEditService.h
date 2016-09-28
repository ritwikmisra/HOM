//
//  ProfileEditService.h
//  HOM
//
//  Created by AppsbeeTechnology on 31/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface ProfileEditService : WebServiceBaseClass


+(id)service;

-(void)callEditDocProfileWebserviceForProfileEditWithId:(NSString *)Strid Name:(NSString *)strFullName Specility:(NSString *)strspecility Degree:(NSString *)strDegree Email:(NSString *)strEmail Description:(NSString *)strDescription Regno:(NSString *)strRegid Depertment:(NSString *)strDeptID prefix:(NSString *)strprefix DocImage:(NSString *)strimgpic withCompletionHandler:(WebServiceCompletion)handler;

@end
