//
//  WPEditorConfiguration.m
//  Pods
//
//  Created by tianpengfei on 16/5/21.
//
//

#import "WPEditorConfiguration.h"
#import "TSLanguageManager.h"

@implementation WPEditorConfiguration

+ (WPEditorConfiguration *)sharedWPEditorConfiguration{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}
-(void)setInsertMedia:(NSArray *)insertMedia{

    _insertMedia = insertMedia;
}
-(void)setLocalizable:(NSString *)localizable{

    _localizable = localizable;
    [TSLanguageManager setSelectedLanguage:_localizable];
}
@end
