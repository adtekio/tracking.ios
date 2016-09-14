//
//  AdtekTracker.h
//  Pods
//
//  Created by Nicky Weber on 13.09.16.
//
//

#import <Foundation/Foundation.h>
#import "AdtekStdOutLogger.h"


@interface AdtekTracker : NSObject

@property (nonatomic, copy, readonly, nonnull) NSURL *url;

// Default is kAdtekTrackerLogLevelOff
@property (nonatomic) AdtekTrackerLogLevel logLevel;

+ (nullable AdtekTracker *)sharedTracker;

- (nullable instancetype)initWithURL:(nonnull NSURL *)url;

- (void)configureWithURL:(nonnull NSURL *)url;


- (void)trackPayment:(nullable NSDictionary *)paramaters;

- (void)trackInstall:(nullable NSDictionary *)paramaters;

- (void)trackStep:(nullable NSDictionary *)paramaters;

- (void)trackApplicationOpen:(nullable NSDictionary *)paramaters;

- (void)trackFunnelStep:(nullable NSDictionary *)paramaters;

- (void)trackEndOfRound:(nullable NSDictionary *)paramaters;

- (void)trackLevelComplete:(nullable NSDictionary *)paramaters;

- (void)trackSceneStart:(nullable NSDictionary *)paramaters;

- (void)trackSceneComplete:(nullable NSDictionary *)paramaters;

@end
