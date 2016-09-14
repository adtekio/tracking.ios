# adtek-ios

A simple library to track events with Adtek on iOS.

[![Version](https://img.shields.io/cocoapods/v/adtek-ios.svg?style=flat)](http://cocoapods.org/pods/adtek-ios)
[![License](https://img.shields.io/cocoapods/l/adtek-ios.svg?style=flat)](http://cocoapods.org/pods/adtek-ios)
[![Platform](https://img.shields.io/cocoapods/p/adtek-ios.svg?style=flat)](http://cocoapods.org/pods/adtek-ios)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

adtek-ios is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "adtek-ios"
```

## Usage

There are two ways to initialize and configure an instance of an AdtekTracker:

*New instance*
```
    AdtekTracker *adtekTracker = [[AdtekTracker alloc] initWithURL:[NSURL URLWithString:@"https://test.adtek.io"]];
    
    or 
    
    AdtekTracker *adtekTracker = [[AdtekTracker alloc] init];    
    [adtekTracker configureWithURL:[NSURL URLWithString:@"https://test.adtek.io"]];    
```

*Shared instance*
```
    AdtekTracker *adtekTracker = [AdtekTracker sharedTracker];
    [adtekTracker configureWithURL:[NSURL URLWithString:@"https://test.adtek.io"]];
```

In any case you will have to provide a base url to track events.

You can find all the availabe trackable events in `AdtekTracker.h`

Any tracking method can take a dictionary for additional parameters you may like to add. NOTE: Provide dictionaries with NSString values and keys only.

For debugging purposes you can set the logging level of a tracker to something more verbose than `kAdtekTrackerLogLevelOff`. See also `AdtekStdOutLogger.h`.


## Author

Nicky Weber

## License

adtek-ios is available under the MIT license. See the LICENSE file for more info.
