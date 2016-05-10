//
//  Macro.h
//  star
//
//  Created by Eric Chen on 16/5/5.
//  Copyright © 2016年 Eric. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/**
 * UIImage object
 */
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]
/**
 * UIColor object with hex string
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


/**
 * UIFont object with fontSize
 */
#define FONT_PROXIMANOVA_REGULAR(s) [UIFont fontWithName:@"ProximaNova-Regular" size:s]
#define FONT_PROXIMANOVA_BOLD(s) [UIFont fontWithName:@"ProximaNova-Bold" size:s]
#define FONT_PROXIMANOVA_SEMIBOLD(s) [UIFont fontWithName:@"ProximaNova-Semibold" size:s]
#define FONT_PROXIMANOVA_REGULARIT(s) [UIFont fontWithName:@"ProximaNova-RegularIt" size:s]
#define FONT_BROWNTT_REGULAR(s) [UIFont fontWithName:@"BrownTT-Regular" size:s]

/**
 *  screen width & screen height
 */
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)


#endif /* macro_h */
