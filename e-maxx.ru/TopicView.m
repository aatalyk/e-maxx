//
//  TopicView.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "TopicView.h"
#import "Algorithm.h"
#import "UIColor+CustomColor.h"
#import "TopicTableViewCell.h"
#import "UIFont+CustomFont.h"

@interface TopicView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TopicView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

-(void)loadChapters {
    
    self.chapterArray = [Algorithm loadChapters:self.topic];
    
    [self.tableView reloadData];
}

-(void)setup {
    
    self.chapterArray = [[NSMutableArray alloc] init];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor cellBackgroundColor];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tableView registerClass:[TopicTableViewCell class] forCellReuseIdentifier:@"ChapterCell"];
    [self addSubview:self.tableView];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0f
                                                      constant:1.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0f
                                                      constant:1.0f]];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.chapterArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChapterCell"];
    Algorithm *algorithm = self.chapterArray[indexPath.row];
    cell.titleLabel.text = algorithm.title;
    cell.titleLabel.font = [UIFont risingSunRegular];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.frame.size.height/6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate pushChapterViewController:self.chapterArray[indexPath.row]];
}

@end
