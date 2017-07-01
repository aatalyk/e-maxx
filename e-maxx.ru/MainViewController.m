//
//  MainViewController.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "UIFont+CustomFont.h"
#import "MainViewController.h"
#import "TopicViewController.h"
#import "UIColor+CustomColor.h"

@interface MainViewController()<PushViewControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self addConstraints];
}

#pragma mark - Private Methods
-(void)setup {
    
    self.title = @"e-maxx";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName:[UIColor whiteColor],
                                            NSFontAttributeName:[UIFont risingSunBold]}];
    
    self.mainView = [[MainView alloc] init];
    [self.mainView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.mainView.delegate = self;
    [self.view addSubview:self.mainView];
}

-(void)addConstraints {
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.mainView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:1.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.mainView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.0f
                                                           constant:1.0f]];
}

-(void)pushViewControllerWithTopic:(NSString *)topic {
    TopicViewController *topicViewController = [[TopicViewController alloc] init];
    topicViewController.topic = topic;
    [self.navigationController pushViewController:topicViewController animated:YES];
}

-(void)viewWillLayoutSubviews {
    [self addConstraints];
}

@end
