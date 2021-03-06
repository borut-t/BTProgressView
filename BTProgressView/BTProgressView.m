//
//  BTProgressView.m
//
//  Version 1.2
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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _progress = 0.f;
        _isRightToLeft = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //width for the current progress value 0% to 100%
    NSInteger progressWidth = floor(_progress * rect.size.width);
    
    //draw progress image
    if (_progressImage != nil) {
        if (_isRightToLeft) {
            [_progressImage drawInRect:CGRectMake(rect.size.width-progressWidth, rect.origin.y, progressWidth, rect.size.height)];
        }
        else {
            [_progressImage drawInRect:CGRectMake(rect.origin.x, rect.origin.y, progressWidth, rect.size.height)];
        }
    }
    //fill progress tint color
    else if (_progressTintColor != nil) {
        CGContextSetFillColorWithColor(context, _progressTintColor.CGColor);
        if (_isRightToLeft) {
            CGContextFillRect(context, CGRectMake(rect.size.width-progressWidth, rect.origin.y, progressWidth, rect.size.height));
        }
        else {
            CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y, progressWidth, rect.size.height));
        }
    }
    
    //draw track image
    if (_trackImage != nil) {
        if (_isRightToLeft) {
            [_trackImage drawInRect:CGRectMake(rect.origin.y, rect.origin.y, rect.size.width-progressWidth, rect.size.height)];
        }
        else {
            [_trackImage drawInRect:CGRectMake(progressWidth, rect.origin.y, rect.size.width-progressWidth, rect.size.height)];
        }
    }
    
    // Draw progress handle if color defined
    if (_progressHandleColor != nil) {
        CGFloat handlePosition = _isRightToLeft ? rect.size.width-progressWidth : progressWidth;
        CGContextMoveToPoint(context, handlePosition-1.f, 0.f);
        CGContextAddLineToPoint(context, handlePosition+1, 0.f);
        CGContextAddLineToPoint(context, handlePosition+1, rect.size.height);
        CGContextAddLineToPoint(context, handlePosition-1.f, rect.size.height);
        CGContextClosePath(context);
        CGContextSetFillColorWithColor(context, self.progressHandleColor.CGColor);
        CGContextFillPath(context);
    }
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

//fill track tint color
- (void)setTrackTintColor:(UIColor *)trackTintColor
{
    _trackTintColor = trackTintColor;
    self.backgroundColor = _trackTintColor;
}

@end
