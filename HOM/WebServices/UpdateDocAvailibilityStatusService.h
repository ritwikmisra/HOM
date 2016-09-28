//
//  UpdateDocAvailibilityStatusService.h
//  HOM
//
//  Created by AppsbeeTechnology on 28/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface UpdateDocAvailibilityStatusService : WebServiceBaseClass

+(id)service;

-(void)callUpdateDocAvailibilityStatusServiceDocid:(NSString *)strDocid DocClinicID:(NSString *)strClinicID Slot:(NSString *)strSlotID BookingDate:(NSString *)strBookingDate  DocStatusID:(NSString *)strDocStatusID DocStatusMsg:(NSString *)strdocStatusMSG withCompletionHandler:(WebServiceCompletion)handler;



@end
