//
//  RBEasingViews.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//

#import "RBEasingViews.h"
#import "RBEasingLayers.h"

@implementation RBLinearView

+ (Class)layerClass { return [RBEasingLayer class]; }

@end

@implementation RBCubicEaseInView

+ (Class)layerClass { return [RBCubicEaseInLayer class]; }

@end

@implementation RBCubicEaseOutView

+ (Class)layerClass { return [RBCubicEaseOutLayer class]; }

@end

@implementation RBBounceOutView

+ (Class)layerClass { return [RBBounceOutLayer class]; }

@end

@implementation RBBackEaseOutView

+ (Class)layerClass { return [RBBackEaseOutLayer class]; }

@end

@implementation RBElasticEaseOutView

+ (Class)layerClass { return [RBElasticEaseOutLayer class]; }

@end