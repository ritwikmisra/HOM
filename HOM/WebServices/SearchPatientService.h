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

<<<<<<< HEAD
-(void)callPatientServiceDocid:(NSString *)strDocid   withCompletionHandler:(WebServiceCompletion)handler;
=======
-(void)calPatientSearchServiceDocid:(NSString *)strDocid   withCompletionHandler:(WebServiceCompletion)handler;
>>>>>>> d282ac4b503549acfa6ff4aafee861d0798b4c57

@end
