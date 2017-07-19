//
//  Algorithm.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Algorithm.h"

@implementation Algorithm

-(instancetype)initWithTitle:(NSString *)title content:(NSString *)content {
    self = [super init];
    
    if(self) {
        self.title = title;
        self.content = content;
    }
    
    return self;
}

+(NSMutableArray*)loadTopics {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emaxx" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path options:kNilOptions error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSArray *topics = dictionary[@"topics"];
    
    printf("%ld", topics.count);
    
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    
    for(NSDictionary *topic in topics) {
        [titles addObject:topic[@"topic"]];
    }

    return titles;
}

+(NSMutableArray*)loadChapters:(NSString*)topic {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emaxx" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path options:kNilOptions error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSArray *topics = dictionary[@"topics"];
    
    NSArray *subject = [[NSArray alloc] init];
    
    for(NSDictionary *item in topics) {
        if([item[@"topic"] isEqualToString:topic]) {
            subject = item[@"content"];
        }
    }
    
    NSMutableArray *chapterArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary *chapter in subject) {
        Algorithm *algorithm = [[Algorithm alloc] initWithTitle:chapter[@"title"] content:chapter[@"content"]];
        [chapterArray addObject:algorithm];
    }
    
    return chapterArray;
}

@end
