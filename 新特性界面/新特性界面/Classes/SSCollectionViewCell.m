//
//  SSCollectionViewCell.m
//  新特性界面
//
//  Created by YFL on 15/9/5.
//  Copyright (c) 2015年 text. All rights reserved.
//

#import "SSCollectionViewCell.h"

@interface SSCollectionViewCell()

@property(nonatomic,weak)UIImageView *imageView;

@end
@implementation SSCollectionViewCell
-(void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}
-(UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *image = [[UIImageView alloc] init];
        _imageView = image;
        [self.contentView addSubview:image];
    }
    return _imageView;
}

- (void)layoutSubviews
{
    self.imageView.frame = self.bounds;
}

@end
