//
//  DocRelatedClinic.h
//  HOM
//
//  Created by AppsbeeTechnology on 07/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DocRelatedClinic : WebServiceBaseClass

+(id)service;

-(void)callDocRelatedClinicWebServicewithDocid:(NSString *)strid withCompletionHandler:(WebServiceCompletion)handler;



@end
