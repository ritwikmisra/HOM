//
//  PhoneNumberLoginService.h
//  HOM
//
//  Created by AppsbeeTechnology on 25/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface PhoneNumberLoginService : WebServiceBaseClass

+(id)service;

-(void)callPhoneNumberLoginServiceWithMobileNumber:(NSString *)strPhoneNumber withCompletionHandler:(WebServiceCompletion)handler;

@end
