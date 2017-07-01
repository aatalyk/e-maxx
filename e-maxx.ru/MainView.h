//
//  MainView.h
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PushViewControllerDelegate<NSObject>

- (void)pushViewControllerWithTopic:(NSString *)topic;

@end

@interface MainView : UIView

@property (weak, nonatomic) id <PushViewControllerDelegate> delegate;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *topicArray;

@end
