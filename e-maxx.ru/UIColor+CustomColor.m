//
//  UIColor+CustomColor.m
//  e-maxx.ru
//
//  Created by Admin on 6/25/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "UIColor+CustomColor.h"

@implementation UIColor (CustomColor)

+(UIColor*)cellBackgroundColor {
    return [UIColor colorWithRed:242.0f/255.0f green:241.0f/255.0f blue:249.0f/255.0f alpha:1.0f];
}

+(UIColor*)emaxxMainColor {
    return [UIColor colorWithRed:123.0f/255.0f green:113.0f/255.0f blue:173.0f/255.0f alpha:1.0f];
}

+(UIColor*)redTextColor {
    return [UIColor colorWithRed:104.0f/255.0f green:6.0f/255.0f blue:11.0f/255.0f alpha:1.0f];
}

@end
