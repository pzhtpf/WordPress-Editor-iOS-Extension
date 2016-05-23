//
//  WPEditorConfiguration.h
//  Pods
//
//  Created by tianpengfei on 16/5/21.
//
//

#import <Foundation/Foundation.h>

// Supported languages.
// Add your specific supported languages here.
#define kLMDefaultLanguage  @"en-US"
#define kLMChinese          @"zh-Hans"
#define kLMChineseTW         @"zh-TW"
#define kLMChineseHK         @"zh-HK"
#define kLMChineseT         @"zh-Hant"

typedef NS_ENUM(NSInteger, ZSSRichTextEditorImageSelect) {
    ZSSRichTextEditorImageSelectPhotoLibrary = 1 << 1,
    ZSSRichTextEditorImageSelectTakePhoto = 1 << 2,
    ZSSRichTextEditorImageSelectInsertNetwork = 1 << 3
};


@interface WPEditorConfiguration : NSObject

+ (WPEditorConfiguration *)sharedWPEditorConfiguration;

@property(strong,nonatomic)NSString *localizable;
@property(strong,nonatomic)NSArray *insertMedia;

@property(nonatomic,assign)ZSSRichTextEditorImageSelect enableImageSelect;
@end
