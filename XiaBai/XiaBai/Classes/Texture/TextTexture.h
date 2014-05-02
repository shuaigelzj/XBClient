//
//  TextTexture.h
//  XiaBai
//
//  Created by oldman on 14-5-2.
//  Copyright (c) 2014年 oldman. All rights reserved.
//

#import "CCTexture.h"
#import "CCColor.h"

@interface TextTexture : CCTexture

- (instancetype)initWithText:(NSString*)text backgroundColor:(CCColor*)bColor foregroundColor:(CCColor*)fColor;

@end
