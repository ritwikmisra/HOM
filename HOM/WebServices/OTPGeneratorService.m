//
//  OTPGeneratorService.m
//  HOM
//
//  Created by AppsbeeTechnology on 25/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "OTPGeneratorService.h"
#import "ModelDoc.h"

@implementation OTPGeneratorService


+(id)service
{
    static OTPGeneratorService *master=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        master=[[OTPGeneratorService alloc]initWithService:WEB_SERVICE_LOGIN];
    });
    return master;
}

-(void)callPhoneNumberLoginServiceWithMobileNumber:(NSString *)strph OTP:(NSString *)strRandomNumber withCompletionHandler:(WebServiceCompletion)handler
{
    if (appDel.isRechable)
    {
        NSMutableArray *arr=[[NSMutableArray alloc] init];
        [arr addObject:[NSString stringWithFormat:@"phone=%@",strph]];
        [arr addObject:[NSString stringWithFormat:@"otp=%@",strRandomNumber]];
        
        NSString *postParams = [[arr componentsJoinedByString:@"&"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //postParams=[postParams stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSLog(@"postParams = %@",postParams);
        NSError *errorConversion;
        //NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&errorConversion];
        NSData *postData = [NSData dataWithBytes: [postParams UTF8String] length: [postParams length]];
        if (errorConversion)
        {
            handler(errorConversion,YES,@"Something is wrong, please try again later...");
        }
        else
        {
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
            [request setURL:urlForService];
            NSLog(@"urlService=%@",urlForService.absoluteString);
            
//            [NSMutableURLRequest basicAuthForRequest:request withUsername:@"admin" andPassword:@"1234"];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setTimeoutInterval:60.0];
            [request setHTTPBody:postData];
            [self displayNetworkActivity];
            [self callWebServiceWithRequest:request Compeltion:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                [self hideNetworkActivity];
                if (error)
                {
                    handler(error,YES,SOMETHING_WRONG);
                }
                else
                {
                    if (data.length>0)
                    {
                        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                        NSError *errorJsonConversion=nil;
                        NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJsonConversion];
                        if (errorJsonConversion)
                        {
                            handler(errorJsonConversion,YES,SOMETHING_WRONG);
                        }
                        else
                        {
                            NSMutableArray *arrDoctor=[responseDict objectForKey:@"doctor"];
                            if (arrDoctor.count>0)
                            {
                                NSDictionary *dict=[arrDoctor firstObject];
                                
                                appDel.objDoctor=[[ModelDoc alloc]initWithDictionary:dict];
                               [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"doc_details"];
                                [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"IsLoggedIn"];
                                [[NSUserDefaults standardUserDefaults]synchronize];
                                handler([dict objectForKey:@"otp"],NO,nil);
                            }
                            else if ([[responseDict objectForKey:@"otp"] isKindOfClass:[NSString class]])
                            {
                                handler([responseDict objectForKey:@"otp"],NO,nil);
                            }
                            else
                            {
                                handler(nil,NO,nil);
                            }
                        }
                    }
                    else
                    {
                        handler(nil,YES,SOMETHING_WRONG);
                    }
                }
            }];
        }
    }
    else
    {
        handler(nil,YES,NO_NETWORK);
    }
    
}

@end
