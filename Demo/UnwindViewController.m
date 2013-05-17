//
//  UnwindViewController.m
//  RBEasingSegues
//
//  Created by Rob Booth on 5/16/13.
//  Copyright (c) 2013 Rob Booth. All rights reserved.
//

#import "UnwindViewController.h"
#import "RBSlideOffSegues.h"

@interface UnwindViewController ()

@property (strong,nonatomic) RBEasingSegue *pushSegue;

@end

@implementation UnwindViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

	[self.navigationItem setHidesBackButton:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Example of how to unwind segues
//
// Need to add a property to hold the segue used to push this viewController
//
// Need to implement these 3 methods:
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
// - (IBAction) unwind:(UIStoryboardSegue *)segue
// - (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender


// Store the first segue we recieve so we can use it's unwindSegue later
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if (self.pushSegue == nil && [segue isKindOfClass:[RBEasingSegue class]])
	{
		self.pushSegue = (RBEasingSegue *)segue;
	}
}

// perform the unwindSegue from the stored pushSegue
- (IBAction) unwind:(UIStoryboardSegue *)segue
{
	[self.pushSegue.unwindSegue perform];
}

// tell iOS that you will handle the unwinding
- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender
{
	if (self.pushSegue.unwindSegue != nil)
		return YES;

	return NO;
}

@end
