//
//  RBEasingSegues.h
//  RBEasingSegues
//
//  Created by Rob Booth on 5/6/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBEasingViews.h"

@interface RBEasingSegue : UIStoryboardSegue

@property (readonly) UIView *easingView;
@property (readonly) CGRect startingFrame;

@end
