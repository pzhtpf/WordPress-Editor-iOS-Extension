//
//  publishedArticleViewModel.h
//  softDecorationMaster
//
//  Created by tianpengfei on 16/3/1.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface publishedArticleViewModel : NSObject
@property(nonatomic,retain)NSString *userId;
@property(nonatomic,retain)NSString *createTime;
@property(nonatomic,retain)NSString *publishedTime;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSString *article_id;
@property(nonatomic,retain)NSString *cover_image_url;
@end
