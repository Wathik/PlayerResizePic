//
//  TWPictureDataTransformer.m
//  PlayerResizePic
//
//  Created by Wathik Almayali on 7/15/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "TWPictureDataTransformer.h"

@implementation TWPictureDataTransformer

+(Class)transformedValueClass
{
    return [NSData class];
}
+(BOOL)allowsReverseTransformation
{
    return YES;
}
-(id)transformedValue:(id)value
{
    return UIImagePNGRepresentation(value);
}
-(id)reverseTransformedValue:(id)value
{
    UIImage *image = [UIImage imageWithData:value];
    return image;
}
@end
