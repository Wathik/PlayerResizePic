//
//  TWAlbumTableViewController.h
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/14/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWAlbumTableViewController:UITableViewController
@property (strong, nonatomic) NSMutableArray *albums;
- (IBAction)addButtonPressed:(UIBarButtonItem *)sender;



@end
