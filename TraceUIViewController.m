//
//  TraceUIViewController.m
//
//  Created by Roland O'Leary on 09/04/09.
//  Copyright 2009 Roland O'Leary. All rights reserved.
//

#import "Tracers.h"
#import "DLogger.h"


@implementation TraceUIViewController


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
    {
        // Custom initialization
        DLOGTRACE();
    }
    
    return self;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc 
{
    [super dealloc];
}

-(void) viewDidLoad
{
	[super viewDidLoad];
	DLOGTRACE();
}

-(void) loadView
{
	[super loadView];
	DLOGTRACE();
}

-(void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	DLOGTRACE();
    DLOG(@"animated: %@", animated ? @"YES" : @"NO");
}

-(void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	DLOGTRACE();
    DLOG(@"animated: %@", animated ? @"YES" : @"NO");
}

-(void) viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	DLOGTRACE();
    DLOG(@"animated: %@", animated ? @"YES" : @"NO");
}

-(void) viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	DLOGTRACE();
    DLOG(@"animated: %@", animated ? @"YES" : @"NO");
}

@end
