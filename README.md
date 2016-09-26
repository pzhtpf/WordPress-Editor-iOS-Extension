# WordPress-Editor-iOS-Extension

[![CI Status](http://img.shields.io/travis/tianpengfei/WordPress-Editor-iOS-Extension.svg?style=flat)](https://travis-ci.org/tianpengfei/WordPress-Editor-iOS-Extension)
[![Version](https://img.shields.io/cocoapods/v/WordPress-Editor-iOS-Extension.svg?style=flat)](http://cocoapods.org/pods/WordPress-Editor-iOS-Extension)
[![License](https://img.shields.io/cocoapods/l/WordPress-Editor-iOS-Extension.svg?style=flat)](http://cocoapods.org/pods/WordPress-Editor-iOS-Extension)
[![Platform](https://img.shields.io/cocoapods/p/WordPress-Editor-iOS-Extension.svg?style=flat)](http://cocoapods.org/pods/WordPress-Editor-iOS-Extension)

WordPress-Editor-iOS-Extension 是一款iOS端的富文本编辑器。

[WordPress-Editor-iOS-Extension](https://github.com/pzhtpf/WordPress-Editor-iOS-Extension) 是从 [WordPress-Editor-iOS](https://github.com/wordpress-mobile/WordPress-Editor-iOS)  的扩展，他支持“从相册中选择”，“拍照”，“插入网络图片”三种方式。并允许用户可以定制编辑器的工具栏。

The expansion of "WordPress-Editor-iOS-Extension" from "WordPress-Editor-iOS", his support "photo library" and "take photo", "insert network picture" three ways. And can allow users to customize the editor toolbar.


![这里写图片描述](http://img.blog.csdn.net/20160323164158125)




![这里写图片描述](http://img.blog.csdn.net/20160323165303405)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

WordPress-Editor-iOS-Extension is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "WordPress-Editor-iOS-Extension"
```

##Usage

1, 你可以设置工具栏的主体色(you can set itemTintColor)
     
```
self.itemTintColor = [UIColor redColor];
```

2, 你可以设置多语言(you can set language)
     
```
#import "WPEditorConfiguration.h"

    WPEditorConfiguration *_WPEditorConfiguration = [WPEditorConfiguration sharedWPEditorConfiguration];
    
// kLMDefaultLanguage  @"en-US"
// kLMChinese          @"zh-Hans"
// kLMChineseTW         @"zh-TW"
// kLMChineseHK         @"zh-HK"
// kLMChineseT         @"zh-Hant"
    
   _WPEditorConfiguration.localizable = kLMChinese;
```

3, 你可以控制插入图片的几种方式(you can control ways of Insert pictures)
     
```
   _WPEditorConfiguration.enableImageSelect =   ZSSRichTextEditorImageSelectPhotoLibrary |ZSSRichTextEditorImageSelectTakePhoto|ZSSRichTextEditorImageSelectInsertNetwork;
```

4, 你可以得到第一张图片的URL，作为封面图(you can get url of first image, as cover image)
     
```
  NSString *cover_image_url = [self.editorView getCoverImage];
```

5, 你也可以得到所有图片的URL(You'll also be able to get URL of  all the image)
     
```
  NSArray *allImage = [self.editorView getAllImage];
```

6, 你可以控制title 输入框是否显示
     
```
  self.editorView.showTitleField = NO;
```

7, 你可以@其他人
     
```
  [self.editorView atUser:@"@RocTian" url:@"http://www.baidu.com"];
```

## Author

tianpengfei, 389744841@qq.com

## License

WordPress-Editor-iOS-Extension is available under the MIT license. See the LICENSE file for more info.
