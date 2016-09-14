//
//  AdtekViewController.m
//  adtek-ios
//
//  Created by Nicky Weber on 09/13/2016.
//  Copyright (c) 2016 Nicky Weber. All rights reserved.
//

#import <Adtek/AdtekTracker.h>
#import "AdtekViewController.h"
#import "CommonTrackingData.h"

@interface AdtekViewController ()

@end

@implementation AdtekViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)trackPayment
{
    [[AdtekTracker sharedTracker] trackPayment:[CommonTrackingData commonDataWithAdditionalData:@{@"Diamonds" : @"10"}]];
}

- (IBAction)trackSceneStart
{
    [[AdtekTracker sharedTracker] trackSceneStart:[CommonTrackingData commonDataWithAdditionalData:@{@"name" : @"intro"}]];
}

- (IBAction)trackSceneComplete
{
    [[AdtekTracker sharedTracker] trackSceneComplete:[CommonTrackingData commonDataWithAdditionalData:@{@"name" : @"intro"}]];
}

- (IBAction)trackStep
{
    [[AdtekTracker sharedTracker] trackStep:[CommonTrackingData commonDataWithAdditionalData:@{@"id" : @"custom"}]];
}

- (IBAction)trackEndOfRound
{
    [[AdtekTracker sharedTracker] trackEndOfRound:[CommonTrackingData commonDataWithAdditionalData:@{@"level" : @"4"}]];
}

- (IBAction)trackFunnelStep
{
    [[AdtekTracker sharedTracker] trackFunnelStep:[CommonTrackingData commonDataWithAdditionalData:@{@"tutorial" : @"intro_premium_currency"}]];
}

- (IBAction)trackLevelComplete
{
    [[AdtekTracker sharedTracker] trackLevelComplete:[CommonTrackingData commonDataWithAdditionalData:@{@"total_round" : @"74"}]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
