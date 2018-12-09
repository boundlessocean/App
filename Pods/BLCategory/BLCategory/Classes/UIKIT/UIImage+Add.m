//
//  UIImage+Add.m
//  BLCategory
//
//  Created by boundlessocean on 2018/12/5.
//

#import "UIImage+Add.h"

@implementation UIImage (Add)

- (UIImage *)imageWithBlur:(CGFloat)radius{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *ciImage = [CIImage imageWithCGImage:self.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:@(radius) forKey: @"inputRadius"];
    
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage = [context createCGImage: result fromRect:ciImage.extent];
    return [UIImage imageWithCGImage:outImage];
}

@end
