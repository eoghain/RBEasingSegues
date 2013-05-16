//
//  RBPushSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/7/13.
//

#import "RBPushSegues.h"

@implementation RBPushSegue

// Push is the same logic as the default RBEasingSegue, this is just for naming

@end


#pragma mark - Right

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


#pragma mark - Left

@implementation RBPushLeftSegue

- (CGRect)startingFrame
{
	// Starting Frame is 2 * the width of the source scrolled so the left 1/2 is visible
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect startingFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width * 2, srcFrame.size.height);
	
	return startingFrame;
}

- (CGRect)endingFrame
{
	// Ending Frame is 2 * the width of the source scrolled so the right 1/2 is visible
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect endingFrame = CGRectMake(0, 0, srcFrame.size.width * 2, srcFrame.size.height);

	return endingFrame;
}

- (void)populateEasingView:(UIView *)easingView
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
	UIViewController *dst = (UIViewController *) self.destinationViewController;

	CGRect srcFrame = src.view.frame;
	
	// need to put the src view and the dst view into easing view
	UIImageView * srcImage = [[UIImageView alloc] initWithImage:[self imageFromView:src.view]];
	srcImage.frame = CGRectMake(srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	UIImageView * dstImage = [[UIImageView alloc] initWithImage:[self imageFromView:dst.view]];
	dstImage.frame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height);

	[easingView addSubview:srcImage];
	[easingView addSubview:dstImage];
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


#pragma mark - Up

@implementation RBPushUpSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect startingFrame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height * 2);

	return startingFrame;
}

- (CGRect)endingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect endingFrame = CGRectMake(0, -srcFrame.size.height, srcFrame.size.width, srcFrame.size.height * 2);

	return endingFrame;
}

- (void)populateEasingView:(UIView *)easingView
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
	UIViewController *dst = (UIViewController *) self.destinationViewController;

	CGRect srcFrame = src.view.frame;

	// need to put the src view and the dst view into easing view
	UIImageView * srcImage = [[UIImageView alloc] initWithImage:[self imageFromView:src.view]];
	srcImage.frame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height);

	UIImageView * dstImage = [[UIImageView alloc] initWithImage:[self imageFromView:dst.view]];
	dstImage.frame = CGRectMake(0, srcFrame.size.height, srcFrame.size.width, srcFrame.size.height);

	[easingView addSubview:srcImage];
	[easingView addSubview:dstImage];
}

@end

@implementation RBPushUpBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBPushUpCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBPushUpBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBPushUpElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end


#pragma mark - Down

@implementation RBPushDownSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect startingFrame = CGRectMake(0, -srcFrame.size.height, srcFrame.size.width, srcFrame.size.height * 2);

	return startingFrame;
}

- (CGRect)endingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect endingFrame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height * 2);

	return endingFrame;
}

- (void)populateEasingView:(UIView *)easingView
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
	UIViewController *dst = (UIViewController *) self.destinationViewController;

	CGRect srcFrame = src.view.frame;

	// need to put the src view and the dst view into easing view
	UIImageView * srcImage = [[UIImageView alloc] initWithImage:[self imageFromView:src.view]];
	srcImage.frame = CGRectMake(0, srcFrame.size.height, srcFrame.size.width, srcFrame.size.height);

	UIImageView * dstImage = [[UIImageView alloc] initWithImage:[self imageFromView:dst.view]];
	dstImage.frame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height);

	[easingView addSubview:dstImage];
	[easingView addSubview:srcImage];
}

@end

@implementation RBPushDownBounceEaseOutSegue

- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBPushDownCubicEaseOutSegue

- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBPushDownBackEaseOutSegue

- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBPushDownElasticEaseOutSegue

- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end