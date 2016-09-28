//
//  ProfileEditModel.h
//  HOM
//
//  Created by AppsbeeTechnology on 31/08/16.
//  Copyright © 2016 Sourav. All rights reserved.
//
#import "ModelBaseClass.h"

@interface ProfileEditModel : ModelBaseClass

-(id)initWithDictionary:(NSDictionary*)dict;

@property(nonatomic,strong) NSString *strEditId;
@property(nonatomic,strong) NSString *strEditRegno;
@property(nonatomic,strong) NSString *strEditPrefix;
@property(nonatomic,strong) NSString *strEditName;
@property(nonatomic,strong) NSString *strEditDescription;
@property(nonatomic,strong) NSString *strEditEmail;
@property(nonatomic,strong) NSString *strEditDepertmentid;
@property(nonatomic,strong) NSString *strEditDegree;
@property(nonatomic,strong) NSString *strEditDocimage;
@property(nonatomic,strong) NSString *strSpecility;
@property(nonatomic,strong) NSString *strphno;
@property(nonatomic,strong) NSString *strDepName;
@property(nonatomic,strong) NSString *strstatus;

@end
