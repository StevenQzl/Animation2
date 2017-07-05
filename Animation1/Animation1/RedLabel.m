//
//  RedLabel.m
//  Animation1
//
//  Created by Qu ZhongLiang on 17/7/5.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//

#import "RedLabel.h"

@implementation RedLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
     CGContextRef context = UIGraphicsGetCurrentContext();
    //画椭圆
    CGContextAddEllipseInRect(context, CGRectMake(160, 180, 20, 8)); //椭圆
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);//填充颜色
}


@end
