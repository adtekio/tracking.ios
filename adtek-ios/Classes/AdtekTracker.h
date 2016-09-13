//
//  AdtekTracker.h
//  Pods
//
//  Created by Nicky Weber on 13.09.16.
//
//

#import <Foundation/Foundation.h>

@interface AdtekTracker : NSObject

@property (nonatomic, copy, readonly, nonnull) NSURL *url;


+ (nullable AdtekTracker *)sharedTracker;

- (nullable instancetype)initWithURL:(nonnull NSURL *)url;

- (void)configureWithURL:(nonnull NSURL *)url;

- (void)trackPayment:(nonnull NSDictionary *)paramaters;

@end
