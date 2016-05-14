#import <UIKit/UIKit.h>
#import "WPEditorViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "publishedArticleViewModel.h"
#import "WYPopoverController.h"

@interface WPViewController : WPEditorViewController <WPEditorViewControllerDelegate,UIActionSheetDelegate,WYPopoverControllerDelegate>
@property(nonatomic,retain)publishedArticleViewModel *viewModel;
@property(nonatomic,retain) WYPopoverController *wypopoverController;
@end
