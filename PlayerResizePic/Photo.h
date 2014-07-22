//
//  Photo.h
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/17/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) Album *albumbook;

@end
