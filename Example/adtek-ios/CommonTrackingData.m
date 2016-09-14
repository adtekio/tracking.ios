#import "CommonTrackingData.h"


@implementation CommonTrackingData
// ${MEMBERS}


#pragma mark - Initialization

- (id)init
{
    self = [super init];

    if (self)
    {

    }

    return self;
}

+ (NSDictionary *)commonDataWithAdditionalData:(NSDictionary *)data
{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:data];

    [result addEntriesFromDictionary:@{
        @"userid" : [[NSUUID UUID] UUIDString],
        @"deviceid"  : [[[UIDevice currentDevice] identifierForVendor] UUIDString],
        @"device" : [[UIDevice currentDevice] model],
        @"systemname" : [[UIDevice currentDevice] systemName],
        @"systemversion" : [[UIDevice currentDevice] systemVersion]
    }];

    return result;
}

@end