//
//  RBSlideOverSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "RBSlideOverSegues.h"

@implementation RBSlideOverSegue

- (void)perform
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;

	CGRect srcFrame = src.view.frame;

	UIView * easingView = self.easingView;
	easingView.frame = self.startingFrame;
	easingView.userInteractionEnabled = NO;
	dst.view.frame = srcFrame;

	// Add dst.view to the bounceView wrapper
	[easingView addSubview:dst.view];
	// Add bounceView to source view for animation
	[src.view addSubview:easingView];

	[UIView animateWithDuration:1.0 animations:^{

		easingView.frame = srcFrame;

	} completion:^(BOOL finished) {

		UINavigationController *nav = src.navigationController;

		// Return dst.view to dst
		dst.view = [easingView.subviews lastObject];
		[nav.view addSubview:dst.view];
		[nav pushViewController:dst animated:NO];
		[easingView removeFromSuperview];
		
	}];
}

@end

#pragma mark - From Right

@implementation RBSlideOverRightSegue

@end

@implementation RBSlideOverRightBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }

@end

@implementation RBSlideOverRightCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverRightBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverRightElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }

@end

#pragma mark - From Left

@implementation RBSlideOverLeftSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return offScreenFrame;
}

@end

@implementation RBSlideOverLeftBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }

@end

@implementation RBSlideOverLeftCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverLeftBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverLeftElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }

@end
