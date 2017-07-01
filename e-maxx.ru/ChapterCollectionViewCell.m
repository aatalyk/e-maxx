//
//  TopicCollectionViewCell.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "UIFont+CustomFont.h"
#import "UIColor+CustomColor.h"
#import "ChapterCollectionViewCell.h"

@implementation ChapterCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont risingSunRegular];
    self.titleLabel.textColor = [UIColor redTextColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.titleLabel];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.8f constant:1.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:1.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:1.0f]];
}

@end
