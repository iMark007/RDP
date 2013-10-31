//
//  AppDelegate.m
//  Realtime Debug Protal
//
//  Created by Feather Chan on 13-3-19.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>
#import "ViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = [[[UINavigationController alloc]initWithRootViewController:self.viewController]autorelease];
    
    
//    unsigned int count;
    
//    Method *m = class_copyMethodList([UIView class], &count);
//    
//    for (int i= 0; i<count; i++) {
//        NSLog(@"Method:%s",method_getName(m[i]));
//        char returntype[256];
//        method_getReturnType(m[i], returntype, 256);
//        int count = method_getNumberOfArguments(m[i]);
//        for (int j = 0; j<count; j++) {
//            char argtype[256];
//            method_getArgumentType(m[i], j, argtype, 256);
//            NSLog(@"Arg:%s",argtype);
//        }
//        NSLog(@"Return:%s",returntype);
//        NSLog(@"Type:%s",method_getTypeEncoding(m[i]));
//    }

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
