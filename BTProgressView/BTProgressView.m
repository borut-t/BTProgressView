//
//  BTProgressView.m
//
//  Version 1.0.0
//
//  Created by Borut Tomazin on 2/21/2013.
//  Copyright 2013 Borut Tomazin
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/borut-t/BTProgressView
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
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
    
    // Compute the width for the current progress value
    NSInteger curWidth = floor([self progress] * rect.size.width);
    
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
