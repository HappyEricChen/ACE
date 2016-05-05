//
//  macro.h
//  star
//
//  Created by Eric Chen on 16/5/5.
//  Copyright © 2016年 Eric. All rights reserved.
//

#ifndef macro_h
#define macro_h

/**
 * UIImage object
 */
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]
/**
 * UIColor object with hex string
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif /* macro_h */
