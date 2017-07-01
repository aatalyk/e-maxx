//
//  MainView.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "MainView.h"
#import "Algorithm.h"
#import "TopicTableViewCell.h"
#import "TopicViewController.h"
#import "UIColor+CustomColor.h"

@interface MainView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MainView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
        
        [self loadTopics];
    }
    
    return self;
}

-(void)setup {
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    
    self.topicArray = [[NSMutableArray alloc] init];
    
    self.tableView = [[UITableView alloc] init];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.rowHeight = screenBounds.size.height/6;
    [self.tableView registerClass:[TopicTableViewCell class] forCellReuseIdentifier:@"TopicCell"];
    [self addSubview:self.tableView];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0f constant:1.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:1.0f]];
}

-(void)loadTopics {
    
    self.topicArray = [Algorithm loadTopics];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.topicArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.topicArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate pushViewControllerWithTopic:self.topicArray[indexPath.row]];
}

@end
