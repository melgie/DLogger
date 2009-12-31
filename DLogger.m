//
//  DLogger.m
//
//  Created by Roland O'Leary on 09/04/09.
//  Copyright 2009 Roland O'Leary. All rights reserved.
//

#import "DLogger.h"

void DLoggerLog(id sender, NSString* format, ...)
{
	if(![DLogger loggingIsEnabledFor:[sender class]])
	{
		// if the class wasn't registered, don't do the logging
		return;
	}
	
	// otherwise, send everything along to NSLogv
	va_list argList;
	va_start(argList, format);
	NSLogv(format, argList);
}

@interface DLogger ()
@property (readwrite, retain, nonatomic) NSMutableSet *registeredClasses;
+(DLogger*) getInstance;
@end


@implementation DLogger

@synthesize registeredClasses;

static DLogger *instance = nil;

+ (DLogger*) getInstance 
{
	@synchronized(self) 
	{
		if( instance == nil )
		{
			[[self alloc] init]; //assignment not done here
			instance.registeredClasses = [[NSMutableSet alloc] initWithCapacity:100];
			[DLogger registerClass:[self class]]; // make sure to register the DLogger
		}
	}
	
	return instance;
}

+(id) allocWithZone:(NSZone *)zone
{
	@synchronized(self) 
	{
		if( instance == nil )
		{
			instance = [super allocWithZone:zone];
			return instance;
		}
	}
	return nil;
}

+(void) registerClass:(Class)klass
{
	[[DLogger getInstance].registeredClasses addObject:klass];
	DLOG(@"Registered Class <%@>", klass);
}

+(BOOL) loggingIsEnabledFor:(Class)klass
{
	return [[DLogger getInstance].registeredClasses containsObject:klass];
}

+(id) copyWithZone:(NSZone *)zone
{
	return self;
}

-(id) retain
{
	return self;
}

-(unsigned) retainCount
{
	return UINT_MAX;
}

-(void) release
{
	// do nothing
}

-(id) autorelease
{
	return self;
}


@end