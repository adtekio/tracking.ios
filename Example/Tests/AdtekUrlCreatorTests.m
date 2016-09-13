//
//  AdtekUrlCreatorTests.m
//  adtek-ios
//
//  Created by Nicky Weber on 13.09.16.
//  Copyright (c) 2016 Nicky Weber. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <adtek_ios/AdtekUrlCreator.h>

@interface AdtekUrlCreatorTests : XCTestCase

@end

@implementation AdtekUrlCreatorTests

- (void)testUrlWithPath
{
    AdtekUrlCreator *adtekUrlCreator = [[AdtekUrlCreator alloc] initWithURL:[NSURL URLWithString:@"https://test.com"]];

    NSURL *url = [adtekUrlCreator urlWithPath:@"here" parameters:@{@"foo" : @"baa"}];

    XCTAssertEqualObjects([url absoluteString], @"https://test.com/here?foo=baa");
}

@end
