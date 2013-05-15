//
//  REEasingLayers.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/3/13.
//

#import "RBEasingLayers.h"

#pragma mark - Base Layer

@interface RBEasingLayer()

@property (readonly) AHEasingFunction animationFunction;

@end

@implementation RBEasingLayer

- (AHEasingFunction)animationFunction
{
	return LinearInterpolation;
}

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key {

	// Fail early
	if (![anim isKindOfClass:[CABasicAnimation class]]) [super addAnimation:anim forKey:key];
	if (![key isEqualToString:@"position"]) [super addAnimation:anim forKey:key];

	CABasicAnimation *basicAnimation = (CABasicAnimation *)anim;
	NSValue *fromValue = basicAnimation.fromValue;
	NSValue *toValue = basicAnimation.toValue;
	NSValue *currentValue = [self valueForKeyPath:key];

	NSValue *actualFromValue = fromValue ? fromValue : currentValue;
	NSValue *actualToValue = toValue ? toValue : currentValue;

	CGPoint fromPoint = [actualFromValue CGPointValue];
	CGPoint toPoint = [actualToValue CGPointValue];

	CAKeyframeAnimation *override = [CAKeyframeAnimation animationWithKeyPath:key function:self.animationFunction fromPoint:fromPoint toPoint:toPoint];

	override.duration = anim.duration;

	override.beginTime = anim.beginTime;
	override.speed = anim.speed;
	override.timeOffset = anim.timeOffset;
	override.repeatCount = anim.repeatCount;
	override.repeatDuration = anim.repeatDuration;
	override.autoreverses = anim.autoreverses;
	override.fillMode = anim.fillMode;

	//	?  
	//	override.timingFunction = anim.timingFunction;
	override.delegate = anim.delegate;
	override.removedOnCompletion = anim.removedOnCompletion;

	[super addAnimation:override forKey:key];
}

@end

#pragma mark - Implementation Layers

@implementation RBBounceOutLayer

- (AHEasingFunction)animationFunction { return BounceEaseOut; }

@end

@implementation RBCubicEaseInLayer

- (AHEasingFunction)animationFunction { return CubicEaseIn; }

@end

@implementation RBCubicEaseOutLayer

- (AHEasingFunction)animationFunction { return CubicEaseOut; }

@end

@implementation RBBackEaseOutLayer

- (AHEasingFunction)animationFunction { return BackEaseOut; }

@end

@implementation RBElasticEaseOutLayer

- (AHEasingFunction)animationFunction { return ElasticEaseOut; }

@end

