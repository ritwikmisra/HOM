//
//  DepertmentService.m
//  HOM
//
//  Created by AppsbeeTechnology on 01/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "DepertmentService.h"

@implementation DepertmentService

+(id)service
{
    static DepertmentService *master=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        master=[[DepertmentService alloc]initWithService:WEB_SERVICE_DEPERTMENT];
    });
    return master;
}

-(void)callDepartmentWebserviceWithCompletionHandler:(WebServiceCompletion)handler
{
    if (appDel.isRechable)
    {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:urlForService];
        NSLog(@"urlService=%@",urlForService.absoluteString);
        
//        [NSMutableURLRequest basicAuthForRequest:request withUsername:@"admin" andPassword:@"1234"];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setTimeoutInterval:60.0];
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
                        handler([responseDict objectForKey:@"departments"],NO,nil);
                    }
                }
                else
                {
                    handler(nil,YES,SOMETHING_WRONG);
                }
            }
        }];
    }
    else
    {
        handler(nil,YES,NO_NETWORK);
    }
    
}


@end
