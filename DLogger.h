//
//  DLogger.h
//
//  Created by Roland O'Leary on 09/04/09.
//  Copyright 2009 Roland O'Leary. All rights reserved.
//

#ifndef __DLOGGER_H_
#define __DLOGGER_H_

#ifndef DEBUG
	#define DLOGGER_REGISTER(klass) {}
	#define DLOGGER_REGISTER_SELF {}
	#define DLOG(string, ...) {}
	#define DLOGTRACE() {}
#else
	#ifndef DLOGGER_REGISTER(klass)
		#define DLOGGER_REGISTER(klass) [DLogger registerClass:klass];
	#endif
	#ifndef DLOGGER_REGISTER_SELF
		#define DLOGGER_REGISTER_SELF [DLogger registerClass:[self class]];
	#endif
	#ifndef DLOG(string, ...)
		#define DLOG(string, ...) DLoggerLog([self class], [NSString stringWithFormat:@"[%@:%s:%d] %@", [self class], __FUNCTION__, __LINE__, string], ##__VA_ARGS__);
	#endif
	#ifndef DLOGTRACE()
		#define DLOGTRACE() DLoggerLog([self class], [NSString stringWithFormat:@"[%@:%s:%d]", [self class], __FUNCTION__, __LINE__]);
	#endif
#endif // #ifdef DEBUG

@interface DLogger : NSObject
{
	@private
	NSMutableSet *registeredClasses;
}

@property (readonly, retain, nonatomic) NSMutableSet *registeredClasses;

+(void) registerClass:(Class)klass;
+(BOOL) loggingIsEnabledFor:(Class)klass;

@end

#endif // guard