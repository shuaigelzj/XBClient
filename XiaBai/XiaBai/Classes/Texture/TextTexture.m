//
//  TextTexture.m
//  XiaBai
//
//  Created by oldman on 14-5-2.
//  Copyright (c) 2014年 oldman. All rights reserved.
//

#import "TextTexture.h"

@implementation TextTexture

- (instancetype)initWithText:(NSString*)text backgroundColor:(CCColor*)bColor foregroundColor:(CCColor*)fColor
{
    CGFloat width = 40;
    CGFloat height = 40;
    CGRect rect = CGRectMake(0, 0, width, height);
    
    // prepare context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width * 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // fill rect
    CGContextSetFillColorWithColor(context, [bColor CGColor]);
    CGContextFillRect(context, rect);
    
    image = CGBitmapContextCreateImage(context);
    
    // draw string
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    CGContextSetStrokeColorWithColor(context, [fColor CGColor]);
    CGContextSetFillColorWithColor(context, [fColor CGColor]);
    UIGraphicsPushContext(context);
    CGAffineTransform flipTransform = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, height), 1, -1);
    CGContextConcatCTM(context, flipTransform);
    [text drawInRect:rect withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:20]}];
    UIGraphicsPopContext();
    
    // get result
    image = CGBitmapContextCreateImage(context);
    self = [super initWithCGImage:image contentScale:2];
    CGContextRelease(context);
    
    return self;
}

@end
