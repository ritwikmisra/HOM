//
//  ModelDoc.h
//  HOM
//
//  Created by AppsbeeTechnology on 04/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelDoc : ModelBaseClass


@property(nonatomic,strong) NSString *strId;
@property(nonatomic,strong) NSString *strRegid;
@property(nonatomic,strong) NSString *strPrefix;
@property(nonatomic,strong) NSString *strName;
@property(nonatomic,strong) NSString *strPhone;
@property(nonatomic,strong) NSString *strDescription;
@property(nonatomic,strong) NSString *strEmail;
@property(nonatomic,strong) NSString *strDepertmentid;
@property(nonatomic,strong) NSString *strDegree;
@property(nonatomic,strong) NSString *strSpecility;
@property(nonatomic,strong) NSString *strDocimage;
@property(nonatomic,strong) NSString *strDepertmentName;
@property(nonatomic,strong) NSString *strTag;


-(id)initWithDictionary:(NSDictionary*)dict;

@end
