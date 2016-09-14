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
@property (nonatomic, strong, nonnull) AdtekStdOutLogger *logger;

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

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        _logger = [[AdtekStdOutLogger alloc] initWithLogLevel:kAdtekTrackerLogLevelOff];
    }

    return self;
}

- (instancetype)initWithURL:(NSURL *)url
{
    AdtekTracker *result = [self init];
    [result configureWithURL:url];
    return result;
}

- (void)configureWithURL:(NSURL *)url
{
    NSParameterAssert(url);
    NSAssert([[url absoluteString] length] > 0, @"url must not be empty");

    [self.logger logDebug:@"Tracker configured with %@", [url absoluteString]];

    _url = [url copy];
}

- (AdtekTrackerLogLevel)logLevel
{
    return self.logger.logLevel;
}

- (void)setLogLevel:(AdtekTrackerLogLevel)logLevel
{
    self.logger.logLevel = logLevel;
}

- (void)trackPayment:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Payment: %@", paramaters];

    [self trackWithPath:@"/t/pay" parameters:paramaters];
}

- (void)trackInstall:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Install: %@", paramaters];

    [self trackWithPath:@"/t/ist" parameters:paramaters];
}

- (void)trackStep:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Step: %@", paramaters];

    [self trackWithPath:@"/t/step" parameters:paramaters];
}

- (void)trackApplicationOpen:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Application Open: %@", paramaters];

    [self trackWithPath:@"/t/apo" parameters:paramaters];
}

- (void)trackFunnelStep:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Funnel Step: %@", paramaters];

    [self trackWithPath:@"/t/fun" parameters:paramaters];
}

- (void)trackEndOfRound:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking End Of Round: %@", paramaters];

    [self trackWithPath:@"/t/eor" parameters:paramaters];
}

- (void)trackLevelComplete:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Level Complete: %@", paramaters];

    [self trackWithPath:@"/t/lvc" parameters:paramaters];
}

- (void)trackSceneStart:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Scene Start: %@", paramaters];

    [self trackWithPath:@"/t/scs" parameters:paramaters];
}

- (void)trackSceneComplete:(NSDictionary *)paramaters
{
    [self.logger logInfo:@"Tracking Scene Complete: %@", paramaters];

    [self trackWithPath:@"/t/scc" parameters:paramaters];
}

- (void)trackWithPath:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSURLSession *session = [NSURLSession sharedSession];

    AdtekUrlCreator *adtekUrlCreator = [[AdtekUrlCreator alloc] initWithURL:self.url];
    NSURL *url = [adtekUrlCreator urlWithPath:path parameters:parameters];

    [self.logger logDebug:@"Tracking %@", url];

    [[session dataTaskWithURL:url
              completionHandler:^(NSData *data,
                                  NSURLResponse *response,
                                  NSError *sessionError)
              {
                  NSHTTPURLResponse *httpurlResponse = (NSHTTPURLResponse *) response;
                  if (httpurlResponse.statusCode != 200)
                  {
                      NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                      [self.logger logError:@"Request (%@) - %d - %@ ", url, httpurlResponse.statusCode, responseString];
                  }
              }] resume];
}

@end
