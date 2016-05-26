//
//  moreItemsCell.m
//  WordPress-Editor-iOS-Extension
//
//  Created by tianpengfei on 16/3/21.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "moreItemsCell.h"

@implementation moreItemsCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
    
        
        NSString *path = [[NSBundle bundleForClass:[moreItemsCell class]] pathForResource:@"rightArrow" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        _rightArrowView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-40,self.contentView.frame.size.height/2-4, 11, 8)];
        [_rightArrowView setImage:image];
        
        
        [self.contentView addSubview:_rightArrowView];
    }

    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
