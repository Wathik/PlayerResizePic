//
//  TWCoredata.m
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/15/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "TWCoredata.h"

@implementation TWCoredata

+(NSManagedObjectContext *)ManagedObjectContext
{ NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
         {
             context =[delegate managedObjectContext];
    }
    return context;
}
@end
