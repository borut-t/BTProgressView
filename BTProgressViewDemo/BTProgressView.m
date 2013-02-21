//
//  BTProgressView.m
//  PlanetTV
//
//  Created by Borut Tomažin on 9/11/12.
//  Copyright (c) 2012 TSmedia, medijske vsebine in storitve, d.o.o. All rights reserved.
//

#import "BTProgressView.h"

//#define kCustomProgressViewFillOffsetX 0
//#define kCustomProgressViewFillOffsetTopY 0
//#define kCustomProgressViewFillOffsetBottomY 0

@implementation BTProgressView

- (void)drawRect:(CGRect)rect
{ 
    //CGSize backgroundStretchPoints = {4, 9}, fillStretchPoints = {3, 8};
    
    // Initialize the stretchable images.
    //UIImage *background = [[UIImage imageNamed:@"progress-bar-bg.png"] stretchableImageWithLeftCapWidth:backgroundStretchPoints.width topCapHeight:backgroundStretchPoints.height];
    //UIImage *background = [[UIImage imageNamed:@"progress-bar-bg.png"] resizableImageWithCapInsets:UIEdgeInsetsZero];
    UIImage *background = [UIImage imageNamed:self.bgImage];
    
    //UIImage *fill = [[UIImage imageNamed:@"progress-bar-fill.png"] stretchableImageWithLeftCapWidth:fillStretchPoints.width topCapHeight:fillStretchPoints.height];
    UIImage *fill = [UIImage imageNamed:self.fillImage];
    
    // Draw the background in the current rect
    [background drawInRect:rect];
    
    // Compute the max width in pixels for the fill.  Max width being how
    // wide the fill should be at 100% progress.
    NSInteger maxWidth = rect.size.width; // - (2 * kCustomProgressViewFillOffsetX);
    
    // Compute the width for the current progress value, 0.0 - 1.0 corresponding
    // to 0% and 100% respectively.
    NSInteger curWidth = floor([self progress] * maxWidth);
    
    // Draw the fill
    [fill drawInRect:CGRectMake(rect.origin.x /*+ kCustomProgressViewFillOffsetX*/,
                                rect.origin.y /*+ kCustomProgressViewFillOffsetTopY*/,
                                curWidth,
                                rect.size.height /*- kCustomProgressViewFillOffsetBottomY*/)];
    
    // Draw progress handle
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, curWidth-rect.size.height, 0.f);
    CGContextAddLineToPoint(context, curWidth, 0.f);
    CGContextAddLineToPoint(context, curWidth, rect.size.height);
    CGContextAddLineToPoint(context, curWidth-rect.size.height, rect.size.height);
    CGContextAddLineToPoint(context, curWidth-rect.size.height, 0.f);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
}

@end
