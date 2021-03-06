//
//  DocProfileEditService.m
//  HOM
//
//  Created by AppsbeeTechnology on 31/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "DocProfileEditService.h"

@implementation DocProfileEditService

+(id)service
{
    static DocProfileEditService *master=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        master=[[DocProfileEditService alloc]initWithService:Edit_Doc_Profile];
    });
    return master;
}

-(void)callRegistrationWebserviceWithImage:(NSString *)strimgpic Docid:(NSString *)strid  Name:(NSString *)strFullName  Depertment:(NSString *)strSelectDep Degree:(NSString *)strDegree Email:(NSString *)strEmail Regid:(NSString *)strRegid Description:(NSString *)strDescription prefix:(NSString *)strprefix withCompletionHandler:(WebServiceCompletion)handler;

{
    if (appDel.isRechable)
    {
        NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
        
        if (strimgpic.length == 0)
        {
            [dict setObject:@"" forKey:@"doc_image"];
        }
        else
        {
            [dict setObject:strimgpic forKey:@"doc_image"];
        }
        if (strEmail.length == 0)
        {
            [dict setObject:@"" forKey:@"email"];
        }
        else
        {
            
            [dict setObject:strEmail forKey:@"email"];
        }
        if (strRegid.length==0)
        {
            [dict setObject:@"" forKey:@"reg_no"];
        }
        else
        {
            [dict setObject:strRegid forKey:@"reg_no"];
        }
        if(strprefix.length==0)
        {
            [dict setObject:@"Dr." forKey:@"prefix"];
        }
        else
        {
            [dict setObject:strprefix forKey:@"prefix"];
            
        }
        
        
        [dict setObject:strid forKey:@"id"];
       //[dict setObject:strSpeciality forKey:@"speciality"];
        [dict setObject:strDegree forKey:@"degree"];
        [dict setObject:strSelectDep forKey:@"dept_id"];
        
        [dict setObject:strDescription forKey:@"desc"];
        [dict setObject:strFullName forKey:@"name"];
        
        
        
        NSError *errorConversion;
        NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&errorConversion];
        NSLog(@"postParams = %@",[[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
        
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
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
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
                            
                            if ([[responseDict objectForKey:@"otp"] isKindOfClass:[NSString class]])
                            {
                                handler(nil,NO,nil);
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
