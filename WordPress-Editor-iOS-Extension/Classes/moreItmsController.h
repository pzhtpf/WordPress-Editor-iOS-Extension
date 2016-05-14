//
//  moreItmsController.h
//  WordPress-Editor-iOS-Extension
//
//  Created by tianpengfei on 16/3/21.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol moreItmsDelegate <NSObject>

-(void)reloadUserSettingItems;

@end

@interface moreItmsController : UIViewController
@property(strong,nonatomic)id<moreItmsDelegate> delegate;
@end
