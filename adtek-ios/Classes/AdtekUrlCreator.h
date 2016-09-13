//
// Created by Nicky Weber on 13.09.16.
//

#import <Foundation/Foundation.h>


@interface AdtekUrlCreator : NSObject

- (nullable instancetype)initWithURL:(nonnull NSURL *)url;

- (nullable NSURL *)urlWithPath:(nonnull NSString *)path parameters:(nonnull NSDictionary *)parameters;

@end
