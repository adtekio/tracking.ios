#import "AdtekUrlCreator.h"


@interface AdtekUrlCreator ()

@property (nonatomic, copy, readwrite) NSURL *url;

@end


@implementation AdtekUrlCreator

- (instancetype)init
{
    [self doesNotRecognizeSelector:_cmd];
    NSLog(@"See interface for available initializers.");
    return nil;
}

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];

    if (self)
    {
        _url = url;
    }

    return self;
}

- (NSURL *)urlWithPath:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSAssert(self.url, @"url not configured");
    NSParameterAssert(path);
    NSParameterAssert(parameters);

    NSURLComponents *components = [self urlWithParamaters:parameters];

    return [components.URL URLByAppendingPathComponent:path];
}

- (NSURLComponents *)urlWithParamaters:(NSDictionary *)parameters
{
    NSURLComponents *components = [NSURLComponents componentsWithURL:self.url resolvingAgainstBaseURL:NO];

    NSMutableArray *queryItems = [NSMutableArray arrayWithCapacity:parameters.count];
    for (NSString *parameterName in parameters)
    {
        NSString *parameterValue = parameters[parameterName];
        NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:parameterName value:parameterValue];
        [queryItems addObject:queryItem];
    }
    components.queryItems = queryItems;

    return components;
}

@end
