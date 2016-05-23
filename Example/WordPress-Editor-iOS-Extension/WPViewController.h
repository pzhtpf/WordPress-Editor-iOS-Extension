#import <UIKit/UIKit.h>
#import "WPEditorViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "publishedArticleViewModel.h"
#import "WPEditorConfiguration.h"

@interface WPViewController : WPEditorViewController <WPEditorViewControllerDelegate,UIActionSheetDelegate>
@property(nonatomic,retain)publishedArticleViewModel *viewModel;
@end
