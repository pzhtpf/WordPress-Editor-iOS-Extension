//
//  LNNotificationCenter.m
//  LNNotificationsUI
//
//  Created by Leo Natan on 9/4/14.
//  Copyright (c) 2014 Leo Natan. All rights reserved.
//

#import "LNNotificationCenter.h"
#import "LNNotification.h"

#import "LNNotificationWindow.h"

static LNNotificationCenter* __ln_defaultNotificationCenter;

static const NSString* _nameKey = @"LNNotificationCenterAppNameKey";
static const NSString* _iconKey = @"LNNotificationCenterAppIconKey";

NSString* const LNNotificationWasTappedNotification = @"LNNotificationWasTappedNotification";;

@implementation LNNotificationCenter
{
	NSMutableDictionary* _applicationMapping;
	LNNotificationWindow* _notificationWindow;
	NSMutableArray* _pendingNotifications;
	
	BOOL _currentlyAnimating;
}

+ (instancetype)defaultCenter
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		__ln_defaultNotificationCenter = [LNNotificationCenter new];
	});
	
	return __ln_defaultNotificationCenter;
}

- (instancetype)init
{
	self = [super init];
	
	if(self)
	{
		_applicationMapping = [NSMutableDictionary new];
		_pendingNotifications = [NSMutableArray new];
	}
	
	return self;
}

- (void)registerApplicationWithIdentifier:(NSString*)appIdentifer name:(NSString*)name icon:(UIImage*)icon
{
	NSParameterAssert(appIdentifer != nil);
	NSParameterAssert(name != nil);
	
	
	_applicationMapping[appIdentifer] = @{_nameKey: name, _iconKey: @"123"};
}

- (void)presentNotification:(LNNotification*)notification forApplicationIdentifier:(NSString*)appIdentifer;
{
	NSAssert(_applicationMapping[appIdentifer] != nil, @"Unrecognized application identifier: %@. The application must be registered with the notification center before attempting presentation of notifications for the application.", appIdentifer);
	NSParameterAssert(notification.message != nil);
	
	LNNotification* pendingNotification = [notification copy];
	
	pendingNotification.title = notification.title ? notification.title : _applicationMapping[appIdentifer][_nameKey];
	pendingNotification.icon = notification.icon ? notification.icon : _applicationMapping[appIdentifer][_iconKey];

	[_pendingNotifications addObject:pendingNotification];

	[self _handlePendingNotifications];
}

- (void)_handlePendingNotifications
{
	if(_notificationWindow == nil)
	{
		_notificationWindow = [[LNNotificationWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
		
		[_notificationWindow setHidden:NO];
	}
	
	if(_currentlyAnimating)
	{
		return;
	}
	
	_currentlyAnimating = YES;
	
	void(^block)() = ^ {
		_currentlyAnimating = NO;
		
		[self _handlePendingNotifications];
	};
	
	if(_pendingNotifications.count == 0)
	{
		if(![_notificationWindow isNotificationViewShown])
		{
			_currentlyAnimating = NO;
			return;
		}
		
		[_notificationWindow dismissNotificationViewWithCompletionBlock:block];
	}
	else
	{
		LNNotification* notification = _pendingNotifications.firstObject;
		[_pendingNotifications removeObjectAtIndex:0];
		
		[_notificationWindow presentNotification:notification completionBlock:block];
	}
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
