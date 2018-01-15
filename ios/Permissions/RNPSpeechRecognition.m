//
//  RNPSpeechRecognition.m
//  ReactNativePermissions
//
//  Created by Tres Trantham on 1/11/17.
//  Copyright © 2017 Yonah Forst. All rights reserved.
//

#import "RNPSpeechRecognition.h"
#import <Speech/Speech.h>

@implementation RNPSpeechRecognition

+ (NSString *)getStatus
{
#if 0
  int status = [SFSpeechRecognizer authorizationStatus];

  switch (status) {
      case SFSpeechRecognizerAuthorizationStatusAuthorized:
          return RNPStatusAuthorized;
      case SFSpeechRecognizerAuthorizationStatusDenied:
          return RNPStatusDenied;
      case SFSpeechRecognizerAuthorizationStatusRestricted:
          return RNPStatusRestricted;
      default:
          return RNPStatusUndetermined;
  }
#else
  return @"";
#endif
}

+ (void)request:(void (^)(NSString *))completionHandler
{
#if 0
    void (^handler)(void) =  ^(void) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler([self.class getStatus]);
        });
    };

    [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
        handler();
    }];
#endif
}

@end
