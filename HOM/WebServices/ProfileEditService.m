//
//  ProfileEditService.m
//  HOM
//
//  Created by AppsbeeTechnology on 31/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ProfileEditService.h"
#import "ProfileEditModel.h"
#import "NSMutableURLRequest+BasicAuth.h"


@implementation ProfileEditService

+(id)service
{
    static ProfileEditService *master=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        master=[[ProfileEditService alloc]initWithService:Edit_Doc_Profile];
    });
    return master;
}

-(void)callEditDocProfileWebserviceForProfileEditWithId:(NSString *)strid Name:(NSString *)strFullName Specility:(NSString *)strspecility Degree:(NSString *)strDegree Email:(NSString *)strEmail Description:(NSString *)strDescription Regno:(NSString *)strRegid Depertment:(NSString *)strDeptID prefix:(NSString *)strprefix DocImage:(NSString *)strimgpic withCompletionHandler:(WebServiceCompletion)handler

{
//    if (appDel.isRechable)
//    {
//        NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
//        
//        if (strimgpic.length == 0)
//        {
//            [dict setObject:@"" forKey:@"doc_image"];
//        }
//        else
//        {
//            [dict setObject:strimgpic forKey:@"doc_image"];
//        }
//        if (strEmail.length == 0)
//        {
//            [dict setObject:@"" forKey:@"email"];
//        }
//        else
//        {
//            
//            [dict setObject:strEmail forKey:@"email"];
//        }
//        if (strRegid.length==0)
//        {
//            [dict setObject:@"" forKey:@"reg_no"];
//        }
//        else
//        {
//            [dict setObject:strRegid forKey:@"reg_no"];
//        }
//        if(strprefix.length==0)
//        {
//            [dict setObject:@"Dr." forKey:@"prefix"];
//        }
//        else
//        {
//            [dict setObject:strprefix forKey:@"prefix"];
//            
//        }
//        
//        
//        [dict setObject:strid forKey:@"id"];
//        [dict setObject:strDegree forKey:@"degree"];
//        [dict setObject:strDeptID forKey:@"dept_id"];
//        
//        [dict setObject:strDescription forKey:@"desc"];
//        [dict setObject:strFullName forKey:@"name"];
//        [dict setObject:strspecility forKey:@"speciality"];
//        
//        NSError *errorConversion;
//        NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&errorConversion];
//        NSLog(@"postParams = %@",[[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
        
//        NSMutableArray *arr=[[NSMutableArray alloc] init];
//        [arr addObject:[NSString stringWithFormat:@"prefix=%@",strprefix]];
//        [arr addObject:[NSString stringWithFormat:@"reg_no=%@",strRegid]];
//        [arr addObject:[NSString stringWithFormat:@"degree=%@",strDegree]];
//        [arr addObject:[NSString stringWithFormat:@"id=%@",strid]];
//        [arr addObject:[NSString stringWithFormat:@"name=%@",strFullName]];
//        [arr addObject:[NSString stringWithFormat:@"email=%@",strEmail]];
//        [arr addObject:[NSString stringWithFormat:@"doc_image=%@",strimgpic]];
//        [arr addObject:[NSString stringWithFormat:@"speciality=%@",strspecility]];
//        [arr addObject:[NSString stringWithFormat:@"dept_id=%@",strDeptID]];
//        [arr addObject:[NSString stringWithFormat:@"desc=%@",strDescription]];
//
//        
//        NSString *postParams = [[arr componentsJoinedByString:@"&"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        
//        NSLog(@"postParams = %@",postParams);
//        NSError *errorConversion;
//        //NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&errorConversion];
//        NSData *postData = [NSData dataWithBytes: [postParams UTF8String] length: [postParams length]];
//        
//        if (errorConversion)
//        {
//            handler(errorConversion,YES,@"Something is wrong, please try again later...");
//        }
//        else
//        {
//            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
//            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
//            [request setURL:urlForService];
//            NSLog(@"urlService=%@",urlForService.absoluteString);
////            [NSMutableURLRequest basicAuthForRequest:request withUsername:@"admin" andPassword:@"1234"];
//            [request setHTTPMethod:@"POST"];
//            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//            //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//            [request setTimeoutInterval:60.0];
//            [request setHTTPBody:postData];
//            [self displayNetworkActivity];
//            [self callWebServiceWithRequest:request Compeltion:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                [self hideNetworkActivity];
//                if (error)
//                {
//                    handler(error,YES,SOMETHING_WRONG);
//                }
//                else
//                {
//                    if (data.length>0)
//                    {
//                        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//                        NSError *errorJsonConversion=nil;
//                        NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&errorJsonConversion];
//                        if (errorJsonConversion)
//                        {
//                            handler(errorJsonConversion,YES,SOMETHING_WRONG);
//                        }
//                        else
//                        {
//                            if ([[responseDict objectForKey:@"doctor"] isKindOfClass:[NSMutableArray class]] && [[responseDict objectForKey:@"doctor"] count]>0)
//                            {
//                                ModelDoc *objDoc=[[ModelDoc alloc]initWithDictionary:[[responseDict objectForKey:@"doctor"] firstObject]];
//                                NSLog(@"%@",objDoc.strId);
//                                handler([[responseDict objectForKey:@"doctor"] firstObject],NO,nil);
//                            }
//                            else
//                            {
//                                handler(nil,NO,nil);
//                            }
//                        }
//                    }
//                    else
//                    {
//                        handler(nil,YES,SOMETHING_WRONG);
//                    }
//                }
//            }];
//        }
//    }
//    else
//    {
//        handler(nil,YES,NO_NETWORK);
//    }
//    
//}

    if (appDel.isRechable)
    {
        NSMutableArray *arr=[[NSMutableArray alloc] init];
        [arr addObject:[NSString stringWithFormat:@"prefix=%@",strprefix]];
                [arr addObject:[NSString stringWithFormat:@"reg_no=%@",strRegid]];
                [arr addObject:[NSString stringWithFormat:@"degree=%@",strDegree]];
                [arr addObject:[NSString stringWithFormat:@"id=%@",strid]];
                [arr addObject:[NSString stringWithFormat:@"name=%@",strFullName]];
                [arr addObject:[NSString stringWithFormat:@"email=%@",strEmail]];
                [arr addObject:[NSString stringWithFormat:@"doc_image=%@",strimgpic]];
                [arr addObject:[NSString stringWithFormat:@"speciality=%@",strspecility]];
                [arr addObject:[NSString stringWithFormat:@"dept_id=%@",strDeptID]];
                [arr addObject:[NSString stringWithFormat:@"desc=%@",strDescription]];

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
            [NSMutableURLRequest basicAuthForRequest:request withUsername:@"admin" andPassword:@"123456"];
            
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//            [request setValue:@"Basic YWRtaW46MTIzNA==" forHTTPHeaderField:@"Authorization"];

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
                            if ([[responseDict objectForKey:@"doctor"] isKindOfClass:[NSMutableArray class]] && [[responseDict objectForKey:@"doctor"] count]>0)
                            {
                                ModelDoc *objDoc=[[ModelDoc alloc]initWithDictionary:[[responseDict objectForKey:@"doctor"] firstObject]];
                                NSLog(@"%@",objDoc.strId);
                                handler([[responseDict objectForKey:@"doctor"] firstObject],NO,nil);
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
