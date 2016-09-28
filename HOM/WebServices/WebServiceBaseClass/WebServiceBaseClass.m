//
//  WebServiceBaseClass.m
//  CARLiFESTYLEExchange
//
//  Created by appsbeetech on 29/01/16.
//  Copyright © 2016 appsbeetech. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import "NetworkActivityViewController.h"


//#define BASE_URL @"http://dev.healthonmobile.in/"s
//#define BASE_URL @"http://pro.healthonmobile.in/"
#define BASE_URL @"http://192.168.0.157/"
//readtags
NSString *const strAPI[]={
    [WEB_SERVICE_PHONE]       =       @"api/doctors/checkPhoneNumber",
    [WEB_SERVICE_LOGIN]       =       @"api/doctors/login",
    [WEB_SERVICE_DEPERTMENT]  =      @"api/doctors/getAllDepartment",
    [UPDATE_DOCTOR]           =      @"api/doctors/updateDoctor",
    [ADD_DOCTOR]              =      @"api/doctors/addDoctor",
    [Edit_Doc_Profile]        =      @"api/doctors/editDoctorProfile",
    [Doc_Related_Clinic]      =     @"api/doctors/doctorRelatedClinics",
    [Reg_Doc_Pvt_Clinic]      =     @"api/doctors/registerDoctorPrivateClinic",
    [ Doc_clinic_detail]      =     @"api/doctors/doctorClinicDetails",
};
@implementation WebServiceBaseClass

-(id)initWithService:(WEB_SERVICES)service
{
    if (self=[super init])
    {
        urlForService=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BASE_URL,strAPI[service]]];
        appDel=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    }
    return self;
}
-(void)displayNetworkActivity
{
    NetworkActivityViewController *netwokActivity=[NetworkActivityViewController sharedInstance];
    UIWindow *window=[[UIApplication sharedApplication] keyWindow];
    netwokActivity.view.frame=CGRectMake(0, 0, window.frame.size.width, window.frame.size.height);
    [window addSubview:netwokActivity.view];
    [netwokActivity changeAnimatingStatusTo:YES];
}
-(void)hideNetworkActivity
{
    NetworkActivityViewController *netwokActivity=[NetworkActivityViewController sharedInstance];
    [netwokActivity.view removeFromSuperview];
    [netwokActivity changeAnimatingStatusTo:NO];
}
-(void)callWebServiceWithRequest:( NSMutableURLRequest* _Nullable)request Compeltion:(void(^ _Nullable )(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))handler
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:nil delegateQueue: [NSOperationQueue  mainQueue]];
    NSString *authStr = @"admin:1234";
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat: @"Basic %@",[authData base64EncodedStringWithOptions:0]];
    defaultConfigObject.HTTPAdditionalHeaders = @{@"Authorization": authValue};
    NSURLSessionDataTask *dataTask=[defaultSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        handler(data,response,error);
    }];
    [dataTask resume];
}
@end
