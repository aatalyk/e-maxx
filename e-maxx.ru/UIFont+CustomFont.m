//
//  UIFont+CustomFont.m
//  e-maxx.ru
//
//  Created by Admin on 6/24/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "UIFont+CustomFont.h"

@implementation UIFont (CustomFont)

+(UIFont*)risingSunRegular {
    return [UIFont fontWithName:@"RisingSun-Regular" size:20];
}

+(UIFont*)risingSunRegularSmall {
    return [UIFont fontWithName:@"RisingSun-Regular" size:[UIScreen mainScreen].bounds.size.width*0.04];
}

+(UIFont*)risingSunBold {
    return [UIFont fontWithName:@"RisingSun-Bold" size:24];
}

@end
