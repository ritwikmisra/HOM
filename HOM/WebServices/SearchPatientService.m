//
//  SearchPatientService.m
//  HOM
//
//  Created by appsbeetech on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "SearchPatientService.h"
#import "ModelPatient.h"

@implementation SearchPatientService

+(id)service
{
    static SearchPatientService *master=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        master=[[SearchPatientService alloc]initWithService:Doc_patient_search];
    });
    return master;
}

-(void)calPatientSearchServiceDocid:(NSString *)strDocid   withCompletionHandler:(WebServiceCompletion)handler;
{
    
    if (appDel.isRechable)
    {
        
        NSMutableArray *arr=[[NSMutableArray alloc] init];
        [arr addObject:[NSString stringWithFormat:@"doctor_id=%@",strDocid]];
        
        NSString *postParams = [[arr componentsJoinedByString:@"&"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"postParams = %@",postParams);
        NSError *errorConversion;
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
            
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setValue:@"Basic YWRtaW46MTIzNA==" forHTTPHeaderField:@"Authorization"];
            
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
            //Authorization Basic YWRtaW46MTIzNA==
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
                            @try
                            {
                                NSMutableArray *arrUser=[responseDict objectForKey:@"user"];
                                NSMutableArray *arrResponse=[[NSMutableArray alloc] initWithCapacity:arrUser.count];
                                for (NSDictionary *dic in arrUser)
                                {
                                    ModelPatient *objPatient=[[ModelPatient alloc]initWithDictionary:dic];
                                    [arrResponse addObject:objPatient];
                                }
                                handler(arrResponse,NO,nil);
                            }
                            @catch (NSException *exception)
                            {
                                
                            }
                            @finally
                            {
                                
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
