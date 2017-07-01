//
//  TopicView.h
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Algorithm.h"

@protocol PushChapterViewControllerDelegate<NSObject>

-(void)pushChapterViewController:(Algorithm *)algorithm;

@end

@interface TopicView : UIView

@property (weak, nonatomic) id<PushChapterViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *topic;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *chapterArray;

-(void)loadChapters;

@end
