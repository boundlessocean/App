//
//  UILabel+Add.m
//  App
//
//  Created by boundlessocean on 2018/12/8.
//  Copyright © 2018年 boundless. All rights reserved.
//

#import "UILabel+Add.h"

@implementation UILabel (Add)
- (void)bs_configTag:(UIView *)tag
                    :(NSString *)text{
    
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (tag) {
        // 附件
        NSTextAttachment *attach = NSTextAttachment.new;
        attach.bounds = CGRectMake(0, 0, tag.bounds.size.width + 5, tag.bounds.size.height);
        NSAttributedString *strAtt = [NSAttributedString attributedStringWithAttachment:attach];
        [string insertAttributedString:strAtt atIndex:0];
        [self addSubview:tag];
    }
    
    
    // 行间距
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.lineSpacing = 5;
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    [string addAttributes:@{NSParagraphStyleAttributeName:paragraphStyle} range:NSMakeRange(0, string.length - 1)];
    
    self.attributedText = string;
}
@end
