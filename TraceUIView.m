//
//  TraceUIView.m
//
//  Created by Roland O'Leary on 09/04/09.
//  Copyright 2009 Roland O'Leary. All rights reserved.
//

#import "Tracers.h"
#import "DLogger.h"

@implementation TraceUIView


- (id)initWithFrame:(CGRect)frame 
{
    if (self = [super initWithFrame:frame]) 
    {
        DLOGTRACE();
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect 
{
    [super drawRect:rect];
    // Drawing code
    DLOGTRACE();
}


- (void)dealloc {
    [super dealloc];
}


@end
