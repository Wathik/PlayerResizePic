//
//  TWIMAGECOLLECTIONViewController.h
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/15/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface TWIMAGECOLLECTIONViewController : UICollectionViewController
@property (strong,nonatomic) Album *album;
- (IBAction)CamerabuttonPress:(UIBarButtonItem *)sender;

@end
