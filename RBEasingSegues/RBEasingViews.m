//
//  RBEasingViews.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "RBEasingViews.h"
#import "RBEasingLayers.h"

@implementation RBLinearView

+ (Class)layerClass
{
	return [RBEasingLayer class];
}

@end

@implementation RBEaseInView

+ (Class)layerClass
{
	return [RBEaseInLayer class];
}

@end

@implementation RBBounceOutView

+ (Class)layerClass
{
	return [RBBounceOutLayer class];
}

@end

@implementation RBBackEaseOutView

+ (Class)layerClass
{
	return [RBBackEaseOutLayer class];
}

@end