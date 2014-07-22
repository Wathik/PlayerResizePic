//
//  TWIMAGECOLLECTIONViewController.m
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/15/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "TWIMAGECOLLECTIONViewController.h"
#import "TWPhotoCollectionViewCell.h"
#import "Photo.h"
#import "TWPictureDataTransformer.h"
#import "TWCoredata.h"
#import  "TWPHOTODETAILVIEWCONTROLLERViewController.h"

@interface TWIMAGECOLLECTIONViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) NSMutableArray *photos; // of UIImages
@property (strong, nonatomic) UIImage *image;

@end

@implementation TWIMAGECOLLECTIONViewController

-(NSMutableArray *)photos
{ if(!_photos){
    _photos = [[NSMutableArray alloc] init];
}
    return _photos;
}

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
-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSSet *unorderPhotos = self.album.photo;
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date"ascending:YES];
    NSArray *sortPhotos = [unorderPhotos sortedArrayUsingDescriptors:@[dateDescriptor]];
    self.photos = [sortPhotos mutableCopy];
    [self.collectionView reloadData];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Detail Segue"])
    
    {
        if ([segue.destinationViewController isKindOfClass:[TWPHOTODETAILVIEWCONTROLLERViewController class]]){
            
           TWPHOTODETAILVIEWCONTROLLERViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *indexPath =[[self.collectionView indexPathsForSelectedItems] lastObject];
            
            Photo *selectedPhoto = self.photos[indexPath.row];
            targetViewController.photo =selectedPhoto;
            
          
      }
   }
}

#pragma MARK UICOLLECTIONIMAGEVIEWCONTROLLER

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Player Cell";
    TWPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Photo *photo = self.photos[indexPath.row];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = photo.image;
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
    
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

*/
- (IBAction)CamerabuttonPress:(UIBarButtonItem *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }
    else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        picker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
    }
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark-helper methods

-(Photo *)photoFromImage:(UIImage *)image
{
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:[TWCoredata ManagedObjectContext]];
    photo.image =image;
    photo.date =[NSDate date];
    photo.albumbook = self.album;
    
    NSError *error = nil;
    if (![[photo managedObjectContext]save:&error]) {
        NSLog(@"%@", error);
            }
          return photo;
}

#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (!image) image = info[UIImagePickerControllerEditedImage];
    
    [self.photos addObject:[self photoFromImage:image]];
    
    [self.collectionView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"Cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
