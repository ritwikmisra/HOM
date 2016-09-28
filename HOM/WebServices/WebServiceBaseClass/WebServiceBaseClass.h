//
//  WebServiceBaseClass.h
//  CARLiFESTYLEExchange
//
//  Created by appsbeetech on 29/01/16.
//  Copyright © 2016 appsbeetech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
// #import "NSMutableURLRequest+BasicAuth.h"


#define SOMETHING_WRONG @"Something is wrong, please try again later!"
#define NO_NETWORK @"Please check the network connection"

typedef  void(^ _Nullable WebServiceCompletion)(_Nullable id result,BOOL isError, NSString * _Nullable strMsg);

typedef NS_ENUM(NSUInteger, WEB_SERVICES) {
    WEB_SERVICE_PHONE,
    WEB_SERVICE_LOGIN,
    WEB_SERVICE_DEPERTMENT,
    UPDATE_DOCTOR,
    ADD_DOCTOR,
    Edit_Doc_Profile,
    Doc_Related_Clinic,
    Reg_Doc_Pvt_Clinic,
    Doc_clinic_detail,
};

@interface WebServiceBaseClass : NSObject
{
    @protected
    NSURL *urlForService;
    AppDelegate *appDel;
}

-(_Nullable id)initWithService:(WEB_SERVICES)service;

-(void)displayNetworkActivity;

-(void)hideNetworkActivity;

-(void)callWebServiceWithRequest:( NSMutableURLRequest* _Nullable)request Compeltion:(void(^ _Nullable )(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))handler;

@end
