//
// Created by Nicky Weber on 14.09.16.
//

#import <Foundation/Foundation.h>

typedef enum {
    kAdtekTrackerLogLevelOff = 0,
    kAdtekTrackerLogLevelError = 1,
    kAdtekTrackerLogLevelWarn = 2,
    kAdtekTrackerLogLevelInfo = 3,
    kAdtekTrackerLogLevelDebug = 4,
} AdtekTrackerLogLevel;


@interface AdtekStdOutLogger : NSObject

@property (nonatomic) AdtekTrackerLogLevel logLevel;

- (instancetype)initWithLogLevel:(AdtekTrackerLogLevel)logLevel;

- (void)logError:(NSString *)format, ...;
- (void)logWarn:(NSString *)format, ...;
- (void)logInfo:(NSString *)format, ...;
- (void)logDebug:(NSString *)format, ...;

@end
