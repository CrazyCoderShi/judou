//
//  JudouTestPlugin.m
//  Runner
//
//  Created by 天南 on 2019/2/18.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "JudouTestPlugin.h"

@implementation JudouTestPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"judou.test" binaryMessenger:registrar.messenger];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"getString"]) {
            result([self getString]);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
}

+ (NSString *)getString {
    NSLog(@"调用回来之前...");
    return @"我回来了...";
}

@end
