//
//  RBEasingLayers.h
//  RBEasingSegues
//
//  Created by Rob Booth on 5/3/13.
//

#import <QuartzCore/QuartzCore.h>
#import "CAKeyframeAnimation+AHEasing.h"
#import "easing.h"

@interface RBEasingLayer : CALayer

@end

@interface RBBounceOutLayer : RBEasingLayer

@end

@interface RBCubicEaseInLayer : RBEasingLayer

@end

@interface RBCubicEaseOutLayer : RBEasingLayer

@end

@interface RBBackEaseOutLayer : RBEasingLayer

@end

@interface RBElasticEaseOutLayer : RBEasingLayer

@end