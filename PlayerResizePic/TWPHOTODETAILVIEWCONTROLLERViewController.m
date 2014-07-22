//
//  TWPHOTODETAILVIEWCONTROLLERViewController.m
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/16/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "TWPHOTODETAILVIEWCONTROLLERViewController.h"
#import "Photo.h"
#import "TWFiltersCollectionViewController.h"

@interface TWPHOTODETAILVIEWCONTROLLERViewController ()

@end

@implementation TWPHOTODETAILVIEWCONTROLLERViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated

{
    [super viewWillAppear:YES];
    self.imageview.image = self.photo.image;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Filter Segue"]) {
        if ([segue.destinationViewController isKindOfClass:[TWFiltersCollectionViewController class]]) {
            TWFiltersCollectionViewController *targetViewController = segue.destinationViewController;
            
            targetViewController.photo = self.photo;
        }
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)AddFilter:(UIButton *)sender {
}

- (IBAction)DeletePress:(UIButton *)sender {
    [[self.photo managedObjectContext]deleteObject:self.photo];
    NSLog(@"%@ %@" , self.photo, [self.photo managedObjectContext]);
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
