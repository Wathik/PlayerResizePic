//
//  TWPHOTODETAILVIEWCONTROLLERViewController.h
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/16/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;


@interface TWPHOTODETAILVIEWCONTROLLERViewController : UIViewController
@property(strong,nonatomic) Photo *photo;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)AddFilter:(UIButton *)sender;
- (IBAction)DeletePress:(UIButton *)sender;


@end
