//
//  BLFriendShipCell.m
//  App
//
//  Created by boundlessocean on 2018/12/8.
//  Copyright © 2018年 boundless. All rights reserved.
//

#import "BLFriendShipCell.h"
#import "UILabel+Add.h"
@import YYKit.UIView_YYAdd;
@import BLCategory.UIScreen_Bounds;
@import YYKit.UIImageView_YYWebImage;
@import YYKit.UIControl_YYAdd;
@interface BLFriendShipCell()
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *contentText;
@property (strong, nonatomic) IBOutlet BLIMGView *contentIMG;
@property (strong, nonatomic) IBOutlet BLToolBarView *toolBar;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentIMG_H;
@property (strong, nonatomic) IBOutlet UILabel *topic;

@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *readNumber;

@end
@implementation BLFriendShipCell
static const CGFloat kIMGMaigin = 5;
static const CGFloat kViewLRMargin = 15;
- (void)awakeFromNib {
    [super awakeFromNib];
    _img.layer.cornerRadius = _img.height/2;
    _img.layer.masksToBounds = YES;
}

- (void)setModel:(BLFSModel *)model{
    _model = model;
    CGFloat IMGWitdh = (UIScreen.width - 2 * kViewLRMargin - 2 * kIMGMaigin)/3 ;
    [_img setImageURL:[NSURL URLWithString:_model.avatar]];
    _date.text = _model.createTime;
    _topic.text = _model.headLine;
    _name.text = _model.userName;
    _location.text = _model.address;
    _readNumber.text = @(_model.viewCount).stringValue;
    _contentIMG_H.constant = _model.images.count ? ((_model.images.count - 1)/3 + 1) * (IMGWitdh + kIMGMaigin) : 0;
    _contentIMG.images = _model.images;
    _toolBar.barType = _model.barType;
    [_contentText removeAllSubviews];
    
    BLTagView *tag = BLTagView.new;
    tag.tags = _model.tags;
    [_contentText bs_configTag:_model.tags.count ? tag : nil
                              :_model.topic];
}


@end


@implementation BLTagView

static const CGFloat kTagMargin = 4;
- (void)setTags:(NSArray<NSString *> *)tags{
    if (self.subviews.count) [self removeAllSubviews];
    if (!tags.count) return;
    _tags = tags;
    CGFloat left = 0;
    CGFloat height = 0;
    for (int i=0; i < _tags.count; i++) {
        UILabel *tag = [self initializeTag:tags[i]];
        tag.left = left;
        left = tag.right + kTagMargin;
        height = tag.height;
        [self addSubview:tag];
    }
    self.frame = CGRectMake(0, kTagMargin + 1, left, height);
}

- (UILabel *)initializeTag:(NSString *)text{
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]}];
    UILabel *tag = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width + 2*kTagMargin, size.height + kTagMargin )];
    tag.backgroundColor = [UIColor.blueColor colorWithAlphaComponent:0.5];
    tag.text = text;
    tag.font = [UIFont systemFontOfSize:15];
    tag.textColor = UIColor.whiteColor;
    tag.textAlignment = NSTextAlignmentCenter;
    tag.layer.masksToBounds = YES;
    tag.layer.cornerRadius = 4;
    return tag;
}

@end


@implementation BLIMGView
- (void)setImages:(NSArray<NSString *> *)images{
    _images = images;

    if (self.subviews.count)  [self removeAllSubviews];
    if (!_images.count) return;
    
    CGFloat left = 0;
    CGFloat top = kIMGMaigin;
    CGFloat IMGWitdh = (UIScreen.width - 2 * kViewLRMargin  - 2 * kIMGMaigin)/3 ;
    for (int i=0; i < _images.count; i++) {
        UIImageView *img = UIImageView.new;
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.clipsToBounds = YES;
        img.frame = CGRectMake(left, top, IMGWitdh, IMGWitdh);
        left = (i+1)%3 ? img.right + kIMGMaigin : 0;
        top = (i+1)%3 || !i ? top : img.bottom + kIMGMaigin;
        [img setImageURL:[NSURL URLWithString:images[i]]];
        [self addSubview:img];
    }
}
@end



@implementation BLToolBarView

static const CGFloat kToolBarLineW = 1.0;
static const CGFloat kToolBarLineH = 25.0;
static const CGFloat kToolBarIMGWithTitleMargin = 5.0;

- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.borderColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.3].CGColor;
    self.layer.borderWidth = 1;
}

- (void)setBarType:(BLToolBarViewType)barType{
    _barType = barType;
    if (self.subviews.count)  [self removeAllSubviews];
    BLView *view = (BLView *)self.superview.superview;
    if (_barType) {
        UIButton *share = [self initianizeBtn:@"转发" :@"share"];
        UIButton *help = [self initianizeBtn:@"帮助他" :@"help"];
        UIView *separateLine = [self initianizeSeparateLine:CGPointMake(share.right, share.centerY)];
        help.left = share.right;
        [self addSubview:share];
        [self addSubview:help];
        [self addSubview:separateLine];
        [share addBlockForControlEvents:UIControlEventTouchUpInside
                                  block:^(id  _Nonnull sender)
        {
            !view.bs_viewAction ? : view.bs_viewAction(@(BLFriendShipCellActionTypeShare),@1,NULL);
        }];
        [help addBlockForControlEvents:UIControlEventTouchUpInside
                                 block:^(id  _Nonnull sender)
        {
            !view.bs_viewAction ? : view.bs_viewAction(@(BLFriendShipCellActionTypeHelp),@1,NULL);
        }];
    } else {
        UIButton *share = [self initianizeBtn:@"转发" :@"share"];
        UIButton *comment = [self initianizeBtn:@"评论" :@"comment"];
        UIButton *favour = [self initianizeBtn:@"点赞" :@"like"];
        comment.left = share.right;
        favour.left = comment.right;
        UIView *separateLineL = [self initianizeSeparateLine:CGPointMake(share.right, share.centerY)];
        UIView *separateLineR = [self initianizeSeparateLine:CGPointMake(comment.right, share.centerY)];
        [self addSubview:share];
        [self addSubview:comment];
        [self addSubview:favour];
        [self addSubview:separateLineL];
        [self addSubview:separateLineR];
        
        [share addBlockForControlEvents:UIControlEventTouchUpInside
                                 block:^(id  _Nonnull sender)
        {
            !view.bs_viewAction ? : view.bs_viewAction(@(BLFriendShipCellActionTypeShare),@1,NULL);
        }];
        
        [comment addBlockForControlEvents:UIControlEventTouchUpInside
                                 block:^(id  _Nonnull sender)
         {
             !view.bs_viewAction ? : view.bs_viewAction(@(BLFriendShipCellActionTypeComment),@1,NULL);
         }];
        
        [favour addBlockForControlEvents:UIControlEventTouchUpInside
                                 block:^(id  _Nonnull sender)
        {
            !view.bs_viewAction ? : view.bs_viewAction(@(BLFriendShipCellActionTypeFavour),@1,NULL);
        }];
    }
    
}

- (UIButton *)initianizeBtn:(NSString *)title
                           :(NSString *)imgName{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    item.titleLabel.font = [UIFont systemFontOfSize:14];
    [item setTitleColor:UIColor.darkGrayColor forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [item setTitleEdgeInsets:UIEdgeInsetsMake(0, kToolBarIMGWithTitleMargin, 0, 0)];
    [item setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, kToolBarIMGWithTitleMargin)];
    item.frame = CGRectMake(0, 0, UIScreen.width/(_barType ? 2 : 3), self.height);
    return item;
}

- (UIView *)initianizeSeparateLine:(CGPoint)location{
    UIView *separateLine = UIView.new;
    separateLine.frame = CGRectMake(0, 0, kToolBarLineW, kToolBarLineH);
    separateLine.center = location;
    separateLine.backgroundColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.3];
    return separateLine;
}

@end
