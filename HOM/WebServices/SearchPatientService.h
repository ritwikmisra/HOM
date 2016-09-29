//
//  SearchPatientService.h
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface SearchPatientService : WebServiceBaseClass


+(id)service;

-(void)calPatientSearchServiceDocid:(NSString *)strDocid   withCompletionHandler:(WebServiceCompletion)handler;

@end
