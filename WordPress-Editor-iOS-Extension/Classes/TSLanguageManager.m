//
//  TSLanguageManager.m
//
//  Created by Toni on 22/09/12.
//  Copyright (c) 2012 Toni Sala Echaurren. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "TSLanguageManager.h"

#define kLMSelectedLanguageKey  @"kLMSelectedLanguageKey"
#define contains(str1, str2) ([str1 rangeOfString: str2 ].location != NSNotFound)

@implementation TSLanguageManager

// Update this method with your specific supported languages.
+(BOOL) isSupportedLanguage:(NSString*)language {
    
    if (contains(language, kLMChinese)) {
        return YES;
    }
    if (contains(language, kLMChineseTW)) {
        return YES;
    }
    if (contains(language, kLMDefaultLanguage)) {
        return YES;
    }
    if (contains(language, kLMChineseHK)) {
        return YES;
    }
    if (contains(language, kLMChineseT)) {
        return YES;
    }
    
    return NO;
}

+(NSString*) localizedString:(NSString*)key {
    NSString *selectedLanguage = [TSLanguageManager selectedLanguage];
    
    // Get the corresponding bundle path.
    
     NSString *path = [[NSBundle bundleForClass:[TSLanguageManager class]] pathForResource:selectedLanguage ofType:@"lproj"];
    
    // Get the corresponding localized string.
    NSBundle* languageBundle = [NSBundle bundleWithPath:path];
	NSString* str = [languageBundle localizedStringForKey:key value:@"" table:@"WordPress-Editor-iOS-Extension_Localizable"];
    return str;
}

+(void) setSelectedLanguage:(NSString*)language {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // Check if desired language is supported.
    if ( [self isSupportedLanguage:language] ) {
        
        if(contains(language, kLMDefaultLanguage))
            language = @"en";
        else if(contains(language, kLMChinese))
            language = @"zh-Hans";
        else if(contains(language, kLMChineseTW))
            language = @"zh-Hant";
        else if(contains(language, kLMChineseHK))
            language = @"zh-Hant";
        else if(contains(language, kLMChineseT))
            language = @"zh-Hant";
        
        [userDefaults setObject:language forKey:kLMSelectedLanguageKey];
    } else {
        // if desired language is not supported, set selected language to nil.
        [userDefaults setObject:nil forKey:kLMSelectedLanguageKey];
    }
}

+(NSString*) selectedLanguage {
    // Get selected language from user defaults.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *selectedLanguage = [userDefaults stringForKey:kLMSelectedLanguageKey];
    
    // if the language is not defined in user defaults yet...
    if (selectedLanguage == nil) {
        // Get the system language.
        NSArray* userLangs = [userDefaults objectForKey:@"AppleLanguages"];
        NSString *systemLanguage = [userLangs objectAtIndex:0];
        
        // if system language is supported by LanguageManager, set it as selected language.
        if ( [self isSupportedLanguage:systemLanguage] ) {
            [self setSelectedLanguage:systemLanguage];
            // if not...
        } else {
            // Set the LanguageManager default language as selected language.
            [self setSelectedLanguage:kLMDefaultLanguage];
        }
    }
    
    return [userDefaults stringForKey:kLMSelectedLanguageKey];
}

@end
