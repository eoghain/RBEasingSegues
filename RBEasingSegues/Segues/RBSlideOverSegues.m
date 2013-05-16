//
//  RBSlideOverSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//

#import "RBSlideOverSegues.h"

@implementation RBSlideOverSegue

- (CGRect)endingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
	return [self scrollAdjustedFrame:src.view.frame];
}

- (void)perform
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;

	UIView * easingView = self.easingView;
	easingView.frame = self.startingFrame;
	easingView.userInteractionEnabled = NO;
	dst.view.frame = src.view.frame;

	// Add dst.view to the easingView wrapper
	[easingView addSubview:dst.view];
	// Add easingView to source view for animation
	[src.view addSubview:easingView];

	[UIView animateWithDuration:self.animationDuration animations:^{

		easingView.frame = self.endingFrame;

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
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOverRightCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverRightBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverRightElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

#pragma mark - From Left

@implementation RBSlideOverLeftSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return [self scrollAdjustedFrame:offScreenFrame];
}

@end

@implementation RBSlideOverLeftBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOverLeftCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverLeftBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverLeftElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end
