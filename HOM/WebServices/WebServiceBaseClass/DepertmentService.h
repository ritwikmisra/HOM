//
//  DepertmentService.h
//  HOM
//
//  Created by AppsbeeTechnology on 01/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DepertmentService : WebServiceBaseClass

+(id)service;

-(void)callDepartmentWebserviceWithCompletionHandler:(WebServiceCompletion)handler;
@end
