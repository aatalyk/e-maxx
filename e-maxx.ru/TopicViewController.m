//
//  TopicViewController.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//
#import "TopicView.h"
#import "UIFont+CustomFont.h"
#import "UIColor+CustomColor.h"
#import "TopicViewController.h"
#import "ChapterViewController.h"

@interface TopicViewController ()<PushChapterViewControllerDelegate>

@property (strong, nonatomic) TopicView *topicView;

@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self addConstraints];
}

#pragma mark - Private Methods
-(void)setup {
    
    self.title = self.topic;
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"]
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(returnViewController)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    self.topicView = [[TopicView alloc] init];
    self.topicView.delegate = self;
    self.topicView.topic = self.topic;
    [self.topicView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.topicView];
    
    [self.topicView loadChapters];
}

-(void)addConstraints {
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topicView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:1.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topicView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.0f
                                                           constant:1.0f]];
}

-(void)pushChapterViewController:(Algorithm *)algorithm {
    
    ChapterViewController *chapterViewController = [[ChapterViewController alloc] init];
    chapterViewController.algorithm = algorithm;
    
    [self.navigationController pushViewController:chapterViewController animated:YES];
}

-(void)returnViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillLayoutSubviews {
    [self addConstraints];
}

@end
