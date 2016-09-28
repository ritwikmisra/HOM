//
//  OTPGeneratorService.h
//  HOM
//
//  Created by AppsbeeTechnology on 25/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface OTPGeneratorService : WebServiceBaseClass

+(id)service;

-(void)callPhoneNumberLoginServiceWithMobileNumber:(NSString *)strph OTP:(NSString *)strRandomNumber withCompletionHandler:(WebServiceCompletion)handler;

@end
