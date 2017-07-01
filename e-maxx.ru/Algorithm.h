//
//  Algorithm.h
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Algorithm : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;

-(instancetype)initWithTitle:(NSString *)title content:(NSString *)content;
+(NSMutableArray*)loadTopics;
+(NSMutableArray*)loadChapters:(NSString*)topic;

@end
