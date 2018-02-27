//
//  RNPBluetooth.m
//  ReactNativePermissions
//
//  Created by Yonah Forst on 11/07/16.
//  Copyright © 2016 Yonah Forst. All rights reserved.
//

#import "RNPBluetooth.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface RNPBluetooth() <CBPeripheralDelegate>
@property (strong, nonatomic) CBPeripheralManager* peripheralManager;
@property (copy) void (^completionHandler)(NSString *);
@end

@implementation RNPBluetooth

+ (NSString *)getStatus
{
#if 0
    int status = [CBPeripheralManager authorizationStatus];
    switch (status) {
        case CBPeripheralManagerAuthorizationStatusAuthorized:
            return RNPStatusAuthorized;
        case CBPeripheralManagerAuthorizationStatusDenied:
            return RNPStatusDenied;
        case CBPeripheralManagerAuthorizationStatusRestricted:
            return RNPStatusRestricted;
        default:
            return RNPStatusUndetermined;
    }
#else
  return @"";
#endif
}

- (void)request:(void (^)(NSString *))completionHandler
{
#if 0
    NSString *status = [RNPBluetooth getStatus];
    
    if (status == RNPStatusUndetermined) {
        self.completionHandler = completionHandler;
        
        self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
        [self.peripheralManager startAdvertising:@{}];
    } else {
        completionHandler(status);
    }
#endif
}

- (void) peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheralManager
{
#if 0
    if (self.peripheralManager) {
        [self.peripheralManager stopAdvertising];
        self.peripheralManager.delegate = nil;
        self.peripheralManager = nil;
    }
    
    if (self.completionHandler) {
        //for some reason, checking permission right away returns denied. need to wait a tiny bit
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            self.completionHandler([self.class getStatus]);
            self.completionHandler = nil;
        });
    }
#endif
    
}

@end
