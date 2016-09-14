#import "AdtekStdOutLogger.h"


@implementation AdtekStdOutLogger

- (instancetype)initWithLogLevel:(AdtekTrackerLogLevel)logLevel
{
    self = [super init];

    if (self)
    {
        _logLevel = logLevel;
    }

    return self;
}

- (id)init
{
    return [self initWithLogLevel:kAdtekTrackerLogLevelOff];
}

- (void)logWarn:(NSString *)format, ...
{
    va_list arguments;
    va_start(arguments, format);
    [self logWithLevel:kAdtekTrackerLogLevelWarn format:format arguments:arguments];
    va_end(arguments);
}

- (void)logInfo:(NSString *)format, ...
{
    va_list arguments;
    va_start(arguments, format);
    [self logWithLevel:kAdtekTrackerLogLevelInfo format:format arguments:arguments];
    va_end(arguments);
}

- (void)logDebug:(NSString *)format, ...
{
    va_list arguments;
    va_start(arguments, format);
    [self logWithLevel:kAdtekTrackerLogLevelDebug format:format arguments:arguments];
    va_end(arguments);
}

- (void)logError:(NSString *)format, ...
{
    va_list arguments;
    va_start(arguments, format);
    [self logWithLevel:kAdtekTrackerLogLevelError format:format arguments:arguments];
    va_end(arguments);
}

- (void)logWithLevel:(AdtekTrackerLogLevel)logLevel format:(NSString *)format arguments:(va_list)arguments
{
    if (self.logLevel < logLevel)
    {
        return;
    }

    NSString *msg = [[NSString alloc] initWithFormat:format arguments:arguments];

    NSString *logPrefix = [[NSString alloc] initWithFormat:@"[AdtekTracker][%@] - ", [[self logLevelToString:logLevel] uppercaseString]];

    NSLog(@"%@%@", logPrefix, msg);
}

- (NSString *)logLevelToString:(AdtekTrackerLogLevel)logLevel
{
    switch (logLevel)
    {
        case kAdtekTrackerLogLevelOff: return @"Off";
        case kAdtekTrackerLogLevelError: return @"Error";
        case kAdtekTrackerLogLevelDebug: return @"Debug";
        case kAdtekTrackerLogLevelWarn: return @"Warn";
        case kAdtekTrackerLogLevelInfo: return @"Info";
    }
    return nil;
}

@end
