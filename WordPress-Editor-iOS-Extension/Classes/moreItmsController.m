//
//  moreItmsController.m
//  WordPress-Editor-iOS-Extension
//
//  Created by tianpengfei on 16/3/21.
//  Copyright © 2016年 tianpengfei. All rights reserved.
//

#import "moreItmsController.h"
#import "WPEditorToolbarView.h"
#import "moreItemsCell.h"

@interface moreItmsController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSArray *allItemsDatas;
@property(strong,nonatomic)NSMutableArray *selectData;
@end

@implementation moreItmsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _selectData = [[defaults valueForKey:@"ZSSRichTextEditorToolbarSaveKey"] mutableCopy];

    
    _allItemsDatas = @[@{@"icon":@"icon_format_media",@"title":NSLocalizedString(@"insertMedia", @"插入图片或视频"),@"key":@(ZSSRichTextEditorToolbarInsertImage)},
                       @{@"icon":@"icon_format_bold",@"title":NSLocalizedString(@"bold", @"粗体"),@"key":@(ZSSRichTextEditorToolbarBold)},
                       @{@"icon":@"icon_format_italic",@"title":NSLocalizedString(@"italic", @"斜体"),@"key":@(ZSSRichTextEditorToolbarItalic)},
                       @{@"icon":@"ZSSsubscript",@"title":NSLocalizedString(@"subscript", @"下标"),@"key":@(ZSSRichTextEditorToolbarSubscript)},
                       @{@"icon":@"ZSSsuperscript",@"title":NSLocalizedString(@"superscript", @"上标"),@"key":@(ZSSRichTextEditorToolbarSuperscript)},
                       @{@"icon":@"icon_format_strikethrough",@"title":NSLocalizedString(@"strikethrough", @"删除线"),@"key":@(ZSSRichTextEditorToolbarStrikeThrough)},
                       @{@"icon":@"icon_format_underline",@"title":NSLocalizedString(@"underline", @"下划线"),@"key":@(ZSSRichTextEditorToolbarUnderline)},
                       @{@"icon":@"ZSSclearstyle",@"title":NSLocalizedString(@"RemoveFormat", @"清除格式"),@"key":@(ZSSRichTextEditorToolbarRemoveFormat)},
                       @{@"icon":@"ZSSleftjustify",@"title":NSLocalizedString(@"justifyleft", @"左对齐"),@"key":@(ZSSRichTextEditorToolbarJustifyLeft)},
                       @{@"icon":@"ZSScenterjustify",@"title":NSLocalizedString(@"justifycenter", @"居中"),@"key":@(ZSSRichTextEditorToolbarJustifyCenter)},
                       @{@"icon":@"ZSSrightjustify",@"title":NSLocalizedString(@"justifyright", @"右对齐"),@"key":@(ZSSRichTextEditorToolbarJustifyRight)},
                       @{@"icon":@"ZSSforcejustify",@"title":NSLocalizedString(@"justifyfull", @"两端对齐"),@"key":@(ZSSRichTextEditorToolbarJustifyFull)},
                       @{@"icon":@"ZSSh1",@"title":NSLocalizedString(@"H1", @"一级标题"),@"key":@(ZSSRichTextEditorToolbarH1)},
                       @{@"icon":@"ZSSh2",@"title":NSLocalizedString(@"H2", @"二级标题"),@"key":@(ZSSRichTextEditorToolbarH2)},
                       @{@"icon":@"ZSSh3",@"title":NSLocalizedString(@"H3", @"三级标题"),@"key":@(ZSSRichTextEditorToolbarH3)},
                       @{@"icon":@"ZSSh4",@"title":NSLocalizedString(@"H4", @"四级标题"),@"key":@(ZSSRichTextEditorToolbarH4)},
                       @{@"icon":@"ZSSh5",@"title":NSLocalizedString(@"H5", @"五级标题"),@"key":@(ZSSRichTextEditorToolbarH5)},
                       @{@"icon":@"ZSSh6",@"title":NSLocalizedString(@"H6", @"六级标题"),@"key":@(ZSSRichTextEditorToolbarH6)},
                       @{@"icon":@"ZSStextcolor",@"title":NSLocalizedString(@"textcolor", @"文字颜色"),@"key":@(ZSSRichTextEditorToolbarTextColor)},
                       @{@"icon":@"ZSSbgcolor",@"title":NSLocalizedString(@"backgroundcolor", @"背景颜色"),@"key":@(ZSSRichTextEditorToolbarBackgroundColor)},
                       @{@"icon":@"icon_format_ul",@"title":NSLocalizedString(@"UnorderedList", @"无序列表"),@"key":@(ZSSRichTextEditorToolbarUnorderedList)},
                       @{@"icon":@"icon_format_ol",@"title":NSLocalizedString(@"OrderedList", @"有序列表"),@"key":@(ZSSRichTextEditorToolbarOrderedList)},
                       @{@"icon":@"ZSShorizontalrule",@"title":NSLocalizedString(@"HorizontalRule", @"插入水平线"),@"key":@(ZSSRichTextEditorToolbarHorizontalRule)},
                       @{@"icon":@"ZSSindent",@"title":NSLocalizedString(@"Indent", @"缩进"),@"key":@(ZSSRichTextEditorToolbarIndent)},
                       @{@"icon":@"ZSSoutdent",@"title":NSLocalizedString(@"Outdent", @"减少缩进"),@"key":@(ZSSRichTextEditorToolbarOutdent)},
                       @{@"icon":@"icon_format_link",@"title":NSLocalizedString(@"InsertLink", @"插入链接"),@"key":@(ZSSRichTextEditorToolbarInsertLink)},
                       @{@"icon":@"icon_format_unlink",@"title":NSLocalizedString(@"RemoveLink", @"移除链接"),@"key":@(ZSSRichTextEditorToolbarRemoveLink)},
                       @{@"icon":@"ZSSquicklink",@"title":NSLocalizedString(@"QuickLink", @"快速链接"),@"key":@(ZSSRichTextEditorToolbarQuickLink)},
                       @{@"icon":@"ZSSundo",@"title":NSLocalizedString(@"Undo", @"撤销"),@"key":@(ZSSRichTextEditorToolbarUndo)},
                       @{@"icon":@"ZSSredo",@"title":NSLocalizedString(@"Redo", @"重做"),@"key":@(ZSSRichTextEditorToolbarRedo)},
                       @{@"icon":@"icon_format_quote",@"title":NSLocalizedString(@"BlockQuote", @"引用"),@"key":@(ZSSRichTextEditorToolbarBlockQuote)}
                       ];
    
    [self initView];
}
-(void)initView{
  
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    titleView.backgroundColor = BASECOLOR;
    [self.view addSubview:titleView];
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
    back.imageEdgeInsets = UIEdgeInsetsMake(13, 17, 13, 17);
    NSString *path = [[NSBundle bundleForClass:[moreItmsController class]] pathForResource:@"back" ofType:@"png"];
    UIImage *backImage = [UIImage imageWithContentsOfFile:path];
    [back setImage:backImage forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-60, 20,60, 44)];
    [save setTitle:NSLocalizedString(@"save", @"保存") forState:UIControlStateNormal];
    [save setTitleColor:UIColorFromRGB(0x007AFF) forState:UIControlStateNormal];
    [save addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    save.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.view addSubview:save];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-40, 20, 80, 44)];
    title.text = NSLocalizedString(@"more", @"更多");
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:17.0f];
    title.textColor = [UIColor whiteColor];
    [self.view addSubview:title];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backAction:(UIButton *)button{

    [self dismissViewControllerAnimated:YES completion:^(){
    
        _tableView.delegate = nil;
        [_tableView removeFromSuperview];
        _tableView = nil;
    
    }];
}
-(void)saveAction:(UIButton *)button{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_selectData forKey:@"ZSSRichTextEditorToolbarSaveKey"];
    
    if([_delegate respondsToSelector:@selector(reloadUserSettingItems)])
        [_delegate reloadUserSettingItems];
    
    [self backAction:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  _allItemsDatas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    moreItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moreItmsCell"];

    if(!cell)
        cell = [[moreItemsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"moreItmsCell"];
    
    NSDictionary *temp = _allItemsDatas[indexPath.row];
    
    NSString *path = [[NSBundle bundleForClass:[moreItmsController class]] pathForResource:[temp valueForKey:@"icon"] ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    cell.imageView.image = image;
    cell.textLabel.text = [temp valueForKey:@"title"];
    
    if([_selectData containsObject:[temp valueForKey:@"key"]])
        cell.rightArrowView.hidden = NO;
    
    else
         cell.rightArrowView.hidden = YES;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSDictionary *temp = _allItemsDatas[indexPath.row];
    
    
    if([_selectData containsObject:[temp valueForKey:@"key"]])
        [_selectData removeObject:[temp valueForKey:@"key"]];
    
    else
        [_selectData addObject:[temp valueForKey:@"key"]];

    
    [_tableView reloadData];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
