//
//  imageSelectController.h
//  softDecorationMaster
//
//  Created by tianpengfei on 16/3/3.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol imageSelectDelegate <NSObject>

-(void)imageSelectType:(int)type;

@end

@interface imageSelectController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property(retain,nonatomic)NSArray *data;
@property(weak,nonatomic) id<imageSelectDelegate>  delegate;
@end
