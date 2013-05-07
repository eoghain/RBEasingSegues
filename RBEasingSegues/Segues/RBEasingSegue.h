//
//  RBEasingSegues.h
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	<QuartzCore/QuartzCore.h>
#import "RBEasingViews.h"

#define kRBSegueTime 0.5;

@interface RBEasingSegue : UIStoryboardSegue

@property (readonly) UIView *easingView;
@property (readonly) CGRect startingFrame;
@property (readonly) CGFloat animationDuration;

- (CGRect)scrollAdjustedFrame:(CGRect)frame;
- (UIImage *)imageFromView:(UIView *)view;

@end
