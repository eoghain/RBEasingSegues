//
//  RBSlideOffSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/15/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "RBSlideOffSegues.h"

@implementation RBSlideOffSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return offScreenFrame;
}

- (void)perform
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;

	CGRect srcFrame = [self scrollAdjustedFrame:src.view.frame];

	UIView * easingView = self.easingView;
	easingView.frame = src.view.frame;
	easingView.userInteractionEnabled = NO;
	dst.view.frame = src.view.frame;

	UIImageView * srcImage = [[UIImageView alloc] initWithImage:[self imageFromView:src.view]];
	srcImage.frame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height);

//	UIImageView * dstImage = [[UIImageView alloc] initWithImage:[self imageFromView:dst.view]];
//	dstImage.frame = CGRectMake(srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	[easingView addSubview:srcImage];

	// Add easingView to source view for animation
	[src.view.superview addSubview:dst.view];
	[src.view.superview addSubview:easingView];

	[UIView animateWithDuration:self.animationDuration animations:^{

		easingView.frame = self.startingFrame;

	} completion:^(BOOL finished) {

		UINavigationController *nav = src.navigationController;
		[nav pushViewController:dst animated:NO];
		[easingView removeFromSuperview];
		
	}];
}

@end

#pragma mark - From Right

@implementation RBSlideOffRightSegue

@end

@implementation RBSlideOffRightBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOffRightCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOffRightBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOffRightElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

#pragma mark - From Left

@implementation RBSlideOffLeftSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return offScreenFrame;
}

@end

@implementation RBSlideOffLeftBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOffLeftCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOffLeftElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

