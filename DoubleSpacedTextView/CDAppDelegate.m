//
//  CDAppDelegate.m
//  DoubleSpacedTextView
//
//  Created by Chris Downie on 10/19/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//

#import "CDAppDelegate.h"

#import "CDDoubleSpacedTextViewController.h"

@implementation CDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    // In this demo app, all it does is load the CDDoubleSpacedTextViewController full screen.
    self.window.rootViewController = [CDDoubleSpacedTextViewController new];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
