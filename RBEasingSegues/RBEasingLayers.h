//
//  RBEasingLayers.h
//  RBEasingSegues
//
//  Created by Rob Booth on 5/3/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CAKeyframeAnimation+AHEasing.h"
#import "easing.h"

@interface RBEasingLayer : CALayer

@end

@interface RBBounceOutLayer : RBEasingLayer

@end

@interface RBEaseInLayer : RBEasingLayer

@end

@interface RBBackEaseOutLayer : RBEasingLayer

@end