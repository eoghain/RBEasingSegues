//
//  RBPushSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/7/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "RBPushSegues.h"

@implementation RBPushSegue

// Push is the same logic as the default RBEasingSegue, this is just for naming

@end

#pragma mark - From Right

@implementation RBPushRightSegue

@end

@implementation RBPushRightBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBPushRightCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBPushRightBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBPushRightElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

#pragma mark - From Left

@implementation RBPushLeftSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return [self scrollAdjustedFrame:offScreenFrame];
}

- (void)perform
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;

	CGRect srcFrame = src.view.frame;

	// need an easing view that is 2 * the size of the src.
	CGRect easingFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width * 2, srcFrame.size.height);
	CGRect endFrame = CGRectMake(0, 0, easingFrame.size.width, easingFrame.size.height);
	UIView * easingView = self.easingView;
	easingView.frame = easingFrame;

	// need to put the src view and the dst view into easing view
	UIImageView * srcImage = [[UIImageView alloc] initWithImage:[self imageFromView:src.view]];
	srcImage.frame = CGRectMake(srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	UIImageView * dstImage = [[UIImageView alloc] initWithImage:[self imageFromView:dst.view]];
	dstImage.frame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height);

	[easingView addSubview:srcImage];
	[easingView addSubview:dstImage];

	// Hide src.view behind a pattern so overages don't show it accidentally (i.e. Back animation)
	UIView * patternView = [[UIView alloc] initWithFrame:srcFrame];
	patternView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	[src.view.superview addSubview:patternView];
	
	[src.view.superview addSubview:easingView];

	[UIView animateWithDuration:self.animationDuration animations:^{

		easingView.frame = endFrame;

	} completion:^(BOOL finished) {

		UINavigationController *nav = src.navigationController;
		[nav pushViewController:dst animated:NO];
		[easingView removeFromSuperview];
		
	}];
}

@end

@implementation RBPushLeftBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBPushLeftCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBPushLeftBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBPushLeftElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end