//
//  UIViewController+Unwind.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/16/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "UIViewController+Unwind.h"

@implementation UIViewController (Unwind)

- (IBAction) unwind:(UIStoryboardSegue *)segue
{
	[segue perform];
}

@end
