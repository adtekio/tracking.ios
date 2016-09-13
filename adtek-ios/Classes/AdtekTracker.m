//
//  AdtekTracker.m
//  Pods
//
//  Created by Nicky Weber on 13.09.16.
//
//

#import "AdtekTracker.h"
#import "AdtekUrlCreator.h"

@interface AdtekTracker ()

@property (nonatomic, copy, readwrite, nonnull) NSURL *url;

@end


@implementation AdtekTracker

+ (AdtekTracker *)sharedTracker
{
    static AdtekTracker *sharedTracker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTracker = [[self alloc] init];
    });
    return sharedTracker;
}

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];

    if (self)
    {
        [self configureWithURL:url];
    }

    return self;
}

- (void)configureWithURL:(NSURL *)url
{
    NSParameterAssert(url);
    NSAssert([[url absoluteString] length] > 0, @"url must not be empty");

    _url = [url copy];
}

- (void)trackPayment:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/pay" parameters:paramaters];
}

- (void)trackInstall:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/ist" parameters:paramaters];
}

- (void)trackStep:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/step" parameters:paramaters];
}

- (void)trackApplicationOpen:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/apo" parameters:paramaters];
}

- (void)trackFunnelStep:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/fun" parameters:paramaters];
}

- (void)trackEndOfRound:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/eor" parameters:paramaters];
}

- (void)trackLevelComplete:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/lvc" parameters:paramaters];
}

- (void)trackSceneStart:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/scs" parameters:paramaters];
}

- (void)trackSceneComplete:(NSDictionary *)paramaters
{
    [self trackWithPath:@"/t/scc" parameters:paramaters];
}

- (void)trackWithPath:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSURLSession *session = [NSURLSession sharedSession];

    AdtekUrlCreator *adtekUrlCreator = [[AdtekUrlCreator alloc] initWithURL:self.url];
    NSURL *url = [adtekUrlCreator urlWithPath:path parameters:parameters];
    [[session dataTaskWithURL:url
              completionHandler:^(NSData *data,
                                  NSURLResponse *response,
                                  NSError *sessionError)
              {
                  NSHTTPURLResponse *httpurlResponse = (NSHTTPURLResponse *) response;
                  if (httpurlResponse.statusCode != 200)
                  {
                        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                        NSLog(@"[ADTEKTRACKER][ERROR] - Request (%@) - %d - %@ ", url, httpurlResponse.statusCode, responseString);
                  }
              }] resume];
}

@end
