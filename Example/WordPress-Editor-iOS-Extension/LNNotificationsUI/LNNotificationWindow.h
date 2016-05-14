//
//  LNNotificationWindow.h
//  LNNotificationsUI
//
//  Created by Leo Natan on 9/5/14.
//  Copyright (c) 2014 Leo Natan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNNotification.h"

@interface LNNotificationWindow : UIWindow

@property (nonatomic, readonly) BOOL isNotificationViewShown;

- (void)presentNotification:(LNNotification*)notification completionBlock:(void(^)())completionBlock;
- (void)dismissNotificationViewWithCompletionBlock:(void(^)())completionBlock;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
