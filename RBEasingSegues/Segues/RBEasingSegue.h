//
//  RBEasingSegues.h
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//

#import <UIKit/UIKit.h>
#import	<QuartzCore/QuartzCore.h>
#import "RBEasingViews.h"

#define kRBSegueTime 0.5;

@interface RBEasingSegue : UIStoryboardSegue

@property (readonly) UIView *easingView;
@property (readonly) CGRect startingFrame;
@property (readonly) CGRect endingFrame;
@property (readonly) CGFloat animationDuration;
@property (readonly) UIStoryboardSegue * unwindSegue;

- (id)initAsReverseOfSegue:(UIStoryboardSegue *)segue;
- (void)populateEasingView:(UIView *)easingView;
- (CGRect)scrollAdjustedFrame:(CGRect)frame;
- (UIImage *)imageFromView:(UIView *)view;

@end
