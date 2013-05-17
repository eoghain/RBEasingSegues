//
//  RBSlideOverSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//

#import "RBSlideOverSegues.h"
#import "RBSlideOffSegues.h"

@implementation RBSlideOverSegue

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect startingFrame = CGRectMake(srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return [self scrollAdjustedFrame:startingFrame];
}

- (CGRect)endingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
	return [self scrollAdjustedFrame:src.view.frame];
}

- (void)perform
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;

	[dst prepareForSegue:self sender:nil];

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

		if (![nav.viewControllers containsObject:dst])
		{
			[nav pushViewController:dst animated:NO];
		}
		
		[easingView removeFromSuperview];
		
	}];
}

@end

#pragma mark - Right

@implementation RBSlideOverRightSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffRightSegue alloc] initAsReverseOfSegue:self]; }

@end

@implementation RBSlideOverRightBounceEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffRightBounceEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOverRightCubicEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffRightCubicEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverRightBackEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffRightSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverRightElasticEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffRightElasticEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

#pragma mark - Left

@implementation RBSlideOverLeftSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffLeftSegue alloc] initAsReverseOfSegue:self]; }
- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect startingFrame = CGRectMake(-srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return [self scrollAdjustedFrame:startingFrame];
}

@end

@implementation RBSlideOverLeftBounceEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffLeftBounceEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOverLeftCubicEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffLeftCubicEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverLeftBackEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffLeftSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverLeftElasticEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffLeftElasticEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end


#pragma mark - Up

@implementation RBSlideOverUpSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffDownSegue alloc] initAsReverseOfSegue:self]; }
- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect startingFrame = CGRectMake(0, srcFrame.size.height, srcFrame.size.width, srcFrame.size.height);

	return [self scrollAdjustedFrame:startingFrame];
}

@end

@implementation RBSlideOverUpBounceEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffDownBounceEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOverUpCubicEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffDownCubicEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverUpBackEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffDownSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverUpElasticEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffDownElasticEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end


#pragma mark - Down

@implementation RBSlideOverDownSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffUpSegue alloc] initAsReverseOfSegue:self]; }
- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect startingFrame = CGRectMake(0, -srcFrame.size.height, srcFrame.size.width, srcFrame.size.height);

	return [self scrollAdjustedFrame:startingFrame];
}

@end

@implementation RBSlideOverDownBounceEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffUpBounceEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBounceOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end

@implementation RBSlideOverDownCubicEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffUpCubicEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBCubicEaseOutView alloc] init]; }

@end

@implementation RBSlideOverDownBackEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffUpSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBBackEaseOutView alloc] init]; }

@end

@implementation RBSlideOverDownElasticEaseOutSegue

- (UIStoryboardSegue *)unwindSegue { return [[RBSlideOffUpElasticEaseOutSegue alloc] initAsReverseOfSegue:self]; }
- (UIView *)easingView { return [[RBElasticEaseOutView alloc] init]; }
- (CGFloat)animationDuration { return 1.0; }

@end


