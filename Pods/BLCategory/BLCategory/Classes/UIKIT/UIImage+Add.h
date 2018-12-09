//
//  UIImage+Add.h
//  BLCategory
//
//  Created by boundlessocean on 2018/12/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Add)

/** radius:模糊度 */
- (UIImage *)imageWithBlur:(CGFloat)radius;
@end

NS_ASSUME_NONNULL_END
