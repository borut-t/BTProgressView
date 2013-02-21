//
//  BTProgressView.m
//  BTProgressView
//
//  Created by Borut Tomažin on 2/21/13.
//  Copyright (c) 2013 Borut Tomazin. All rights reserved.
//

#import "BTProgressView.h"

@implementation BTProgressView

- (void)drawRect:(CGRect)rect
{
    // Set background image
    UIImage *background = [UIImage imageNamed:self.bgImage];
    
    // Set fill image
    UIImage *fill = [UIImage imageNamed:self.fillImage];
    
    // Draw the background in the current rect
    [background drawInRect:rect];
    
    // Compute the max width in pixels for the fill
    NSInteger maxWidth = rect.size.width;
    
    // Compute the width for the current progress value
    NSInteger curWidth = floor([self progress] * maxWidth);
    
    // Draw the fill
    [fill drawInRect:CGRectMake(rect.origin.x, rect.origin.y, curWidth, rect.size.height)];
    
    // Draw progress handle
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, curWidth-rect.size.height, 0.f);
    CGContextAddLineToPoint(context, curWidth, 0.f);
    CGContextAddLineToPoint(context, curWidth, rect.size.height);
    CGContextAddLineToPoint(context, curWidth-rect.size.height, rect.size.height);
    CGContextAddLineToPoint(context, curWidth-rect.size.height, 0.f);
    CGContextSetFillColorWithColor(context, self.handleColor.CGColor);
    CGContextFillPath(context);
}

@end
