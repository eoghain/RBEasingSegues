//
//  RBSlideOffSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/15/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "RBSlideOffSegues.h"
#import "RBSlideOverSegues.h"

@implementation RBSlideOffSegue

- (CGRect)endingFrame
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

	[dst prepareForSegue:self sender:nil];
	
	CGRect srcFrame = [self scrollAdjustedFrame:src.view.frame];

	UIView * easingView = self.easingView;
	easingView.frame = src.view.frame;
	easingView.userInteractionEnabled = NO;
	dst.view.frame = src.view.frame;

	UIImageView * srcImage = [[UIImageView alloc] initWithImage:[self imageFromView:src.view]];
	srcImage.frame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height);

	[easingView addSubview:srcImage];

	// Add easingView to source view for animation
	[src.view.superview addSubview:dst.view];
	[src.view.superview addSubview:easingView];

	[UIView animateWithDuration:self.animationDuration animations:^{

		easingView.frame = self.endingFrame;

	} completion:^(BOOL finished) {

		UINavigationController *nav = src.navigationController;

		if (![nav.viewControllers containsObject:dst])
		{
			[nav pushViewController:dst animated:NO];
		}
		[easingView removeFromSuperview];
		
	}];
}

@end


#pragma mark - Right

@implementation RBSlideOffRightSegue

@end

@implementation RBSlideOffRightBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOffRightCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOffRightElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end


#pragma mark - Left

@implementation RBSlideOffLeftSegue

- (CGRect)endingFrame
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


#pragma mark - Up

@implementation RBSlideOffUpSegue

- (CGRect)endingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(0, -srcFrame.size.height, srcFrame.size.width, srcFrame.size.height);

	return offScreenFrame;
}

@end

@implementation RBSlideOffUpBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOffUpCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOffUpElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end


#pragma mark - Down

@implementation RBSlideOffDownSegue

- (CGRect)endingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(0, srcFrame.size.height, srcFrame.size.width, srcFrame.size.height);

	return offScreenFrame;
}

@end

@implementation RBSlideOffDownBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOffDownCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOffDownElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 2.0; }

@end
