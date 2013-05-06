//
//  RBEasingSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "RBEasingSegue.h"

@implementation RBEasingSegue

- (UIView *)easingView
{
	return [[RBLinearView alloc] init];
}

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

	CGRect srcFrame = src.view.frame;
	CGRect offScreenLeftFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

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
		src.view.frame = offScreenLeftFrame;

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
