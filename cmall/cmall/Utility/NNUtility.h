//
//  NNUtility.h
//  cmall
//
//  Created by ddpisces on 15/8/6.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NNApplicationSize       ((SYSTEM_VERSION >= 7) ? ([[UIScreen mainScreen] bounds].size):([[UIScreen mainScreen] applicationFrame].size)) //app 窗口大小

// set LOG level
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;