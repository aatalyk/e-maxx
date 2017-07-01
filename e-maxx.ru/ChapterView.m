//
//  ChapterView.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "ChapterView.h"

@implementation ChapterView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
        
        [self addConstraints];
    }
    
    return self;
}

-(void)setup {
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.webView = [[UIWebView alloc] init];
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.webView];
}

-(void)addConstraints {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.webView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0f
                                                      constant:1.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.webView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0f
                                                      constant:1.0f]];
}

-(void)loadContent {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.webView loadHTMLString:self.algorithm.content baseURL:[[NSBundle mainBundle] bundleURL]];
    });
}

@end
