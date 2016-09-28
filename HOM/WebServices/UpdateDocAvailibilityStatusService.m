//
//  UpdateDocAvailibilityStatusService.m
//  HOM
//
//  Created by AppsbeeTechnology on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "UpdateDocAvailibilityStatusService.h"

@implementation UpdateDocAvailibilityStatusService


+(id)service
{
    static UpdateDocAvailibilityStatusService *master=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        master=[[UpdateDocAvailibilityStatusService alloc]initWithService:Update_doc_Availibility_status];
    });
    return master;
}

-(void)callUpdateDocAvailibilityStatusServiceDocid:(NSString *)strDocid DocClinicID:(NSString *)strClinicID Slot:(NSString *)strSlotID BookingDate:(NSString *)strBookingDate  DocStatusID:(NSString *)strDocStatusID DocStatusMsg:(NSString *)strdocStatusMSG withCompletionHandler:(WebServiceCompletion)handler;

{
    
    if (appDel.isRechable)
    {
        
        NSMutableArray *arr=[[NSMutableArray alloc] init];
        [arr addObject:[NSString stringWithFormat:@"doctor_id=%@",strDocid]];
        [arr addObject:[NSString stringWithFormat:@"clinic_id=%@",strClinicID]];
        [arr addObject:[NSString stringWithFormat:@"slot_id=%@",strSlotID]];
        [arr addObject:[NSString stringWithFormat:@"booking_date=%@",strBookingDate]];
        [arr addObject:[NSString stringWithFormat:@"doc_status_id=%@",strDocStatusID]];
        [arr addObject:[NSString stringWithFormat:@"status_msg=%@",strdocStatusMSG]];
        
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
            //[NSMutableURLRequest basicAuthForRequest:request withUsername:@"admin" andPassword:@"1234"];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"Basic YWRtaW46MTIzNA==" forHTTPHeaderField:@"Authorization"];
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
                            handler(responseDict,NO,nil);
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
