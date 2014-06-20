//
//  BTProgressView.h
//
//  Version 1.1
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

#import <UIKit/UIKit.h>

@interface BTProgressView : UIView

/**
 The current progress.
 */
@property (nonatomic, assign) CGFloat progress;

/**
 The color shown for the portion of the progress bar that is filled.
 */
@property (nonatomic, strong) UIColor *progressTintColor;

/**
 An image to use for the portion of the progress bar that is filled.
 */
@property (nonatomic, strong) UIImage *progressImage;

/**
 Progress handle view. If color is not defined, handle is not drawn.
 */
@property (nonatomic, strong) UIColor *progressHandleColor;

/**
 The color shown for the portion of the progress bar that is not filled.
 */
@property (nonatomic, strong) UIColor *trackTintColor;

/**
 An image to use for the portion of the track that is not filled.
 */
@property (nonatomic, strong) UIImage *trackImage;

@end
