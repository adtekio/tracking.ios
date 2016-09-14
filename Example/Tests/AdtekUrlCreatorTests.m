//
//  AdtekUrlCreatorTests.m
//  adtek-ios
//
//  Created by Nicky Weber on 13.09.16.
//  Copyright (c) 2016 Nicky Weber. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Adtek/adtek-ios-umbrella.h>

@interface AdtekUrlCreatorTests : XCTestCase

@end

@implementation AdtekUrlCreatorTests

- (void)testUrlWithPath_noQueryParamater
{
    AdtekUrlCreator *adtekUrlCreator = [[AdtekUrlCreator alloc] initWithURL:[NSURL URLWithString:@"https://test.com"]];

    NSURL *url = [adtekUrlCreator urlWithPath:@"here" parameters:nil];

    XCTAssertEqualObjects([url absoluteString], @"https://test.com/here");
}

- (void)testUrlWithPath_oneQueryParameter
{
    AdtekUrlCreator *adtekUrlCreator = [[AdtekUrlCreator alloc] initWithURL:[NSURL URLWithString:@"https://test.com"]];

    NSURL *url = [adtekUrlCreator urlWithPath:@"here" parameters:@{@"foo" : @"baa"}];

    XCTAssertEqualObjects([url absoluteString], @"https://test.com/here?foo=baa");
}

@end
