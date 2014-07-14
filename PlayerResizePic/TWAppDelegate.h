//
//  TWAppDelegate.h
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/14/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
