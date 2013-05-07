//
//  RBEasingSegues.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//

#import "RBEasingSegue.h"

@implementation RBEasingSegue

- (UIView *)easingView
{
	return [[RBLinearView alloc] init];
}

- (CGFloat)animationDuration
{
	return kRBSegueTime;
}

- (CGRect)scrollAdjustedFrame:(CGRect)frame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
	
	if ([src.view respondsToSelector:@selector(contentOffset)])
	{
		CGPoint offset = [(UIScrollView *)src.view contentOffset];
		frame.origin.x += offset.x;
		frame.origin.y += offset.y;
	}

	return frame;
}

- (CGRect)startingFrame
{
	UIViewController *src = (UIViewController *) self.sourceViewController;

	CGRect srcFrame = src.view.frame;
	CGRect offScreenFrame = CGRectMake(srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);

	return [self scrollAdjustedFrame:offScreenFrame];
}

- (UIImage *)imageFromView:(UIView *)view
{
	UIImage* screenshot = nil;

	UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
	CGContextRef ctx = UIGraphicsGetCurrentContext();

	if ([view respondsToSelector:@selector(contentOffset)])
	{
		//  KEY: need to translate the context down to the current visible portion of the tablview
		CGContextTranslateCTM(ctx, 0, -((UIScrollView *)view).contentOffset.y);
	}

	[view.layer renderInContext:ctx];
	screenshot = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

//	UIImageWriteToSavedPhotosAlbum(screenshot, self, nil, NULL);
	return screenshot;
}

- (void)perform
{
	UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;

	CGRect srcFrame = src.view.frame;
	
	//  need an easing view that is 2 * the size of the src.
	CGRect easingFrame = CGRectMake(0, 0, srcFrame.size.width * 2, srcFrame.size.height);
	CGRect endFrame = CGRectMake(-srcFrame.size.width, 0, easingFrame.size.width, easingFrame.size.height);
	UIView * easingView = self.easingView;
	easingView.frame = easingFrame;

	// need to put the src view and the dst view into easing view
	UIImageView * srcImage = [[UIImageView alloc] initWithImage:[self imageFromView:src.view]];
	srcImage.frame = CGRectMake(0, 0, srcFrame.size.width, srcFrame.size.height);

	UIImageView * dstImage = [[UIImageView alloc] initWithImage:[self imageFromView:dst.view]];
	dstImage.frame = CGRectMake(srcFrame.size.width, 0, srcFrame.size.width, srcFrame.size.height);
	
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
		[patternView removeFromSuperview];
		[easingView removeFromSuperview];
		
	}];
}

@end
