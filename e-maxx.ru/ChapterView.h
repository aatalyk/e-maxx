//
//  ChapterView.h
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Algorithm.h"
#import <UIKit/UIKit.h>

@interface ChapterView : UIView

@property (strong, nonatomic) Algorithm *algorithm;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIWebView *webView;

-(void)loadContent;

@end
