//
//  AppDelegate.h
//  HOM
//
//  Created by AppsbeeTechnology on 08/07/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ModelDoc.h"
#import "ProfileEditModel.h"
#import "ModelManageClinic.h"
#import "ModelSlots.h"
#import "ProfileEditModel.h"
#import "ModelDoctorSlots.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(assign,nonatomic) BOOL isRechable;


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(nonatomic,strong)ModelDoc *objDoctor;
@property(nonatomic,strong)ProfileEditModel *objEditDoc;
@property(nonatomic,strong)ModelManageClinic *objmanage;
@property(nonatomic,strong)ModelSlots *objslots;
@property(nonatomic,strong)ProfileEditModel *objProfileEdit;
@property(nonatomic,strong)ModelDoctorSlots *objDocSlot;




- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

