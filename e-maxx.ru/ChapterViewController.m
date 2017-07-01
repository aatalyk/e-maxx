//
//  ChapterViewController.m
//  e-maxx.ru
//
//  Created by Admin on 6/25/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Algorithm.h"
#import "ChapterViewController.h"

@interface ChapterViewController ()

@end

@implementation ChapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self addConstraints];
}

-(void)setup {
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"]
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(returnViewController)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    self.chapterView = [[ChapterView alloc] init];
    self.chapterView.algorithm = self.algorithm;
    [self.chapterView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.chapterView];
    
    [self.chapterView loadContent];
}

-(void)returnViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addConstraints {
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.chapterView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:1.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.chapterView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.0f
                                                           constant:1.0f]];
}

-(void)viewWillLayoutSubviews {
    [self addConstraints];
}

@end
