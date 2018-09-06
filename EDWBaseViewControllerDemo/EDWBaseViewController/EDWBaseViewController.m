//
//  EDWBaseViewController.m
//  ttjd
//
//  Created by easyshare on 16/5/14.
//  Copyright © 2016年 yizixuan. All rights reserved.
//

#import "EDWBaseViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MessageUI/MessageUI.h>

@interface EDWBaseViewController ()<MFMessageComposeViewControllerDelegate>

@end

@implementation EDWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

- (void) createUI{
    return;
}

-(UIButton *)infoImageBtn{
    if (!_infoImageBtn) {
        _infoImageBtn = [[UIButton alloc] initWithFrame:self.view.bounds];
        [_infoImageBtn setContentMode:UIViewContentModeCenter];
        [_infoImageBtn setUserInteractionEnabled:NO];
        [_infoImageBtn.titleLabel setNumberOfLines:0];
        [_infoImageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_infoImageBtn setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_infoImageBtn];
        [_infoImageBtn release];
        [_infoImageBtn setHidden:YES];
        
    }
    return _infoImageBtn;
}


#pragma mark - 公共数据源
- (void) createDataSource{
    self.dataSource = [NSMutableArray array];
}

#pragma mark - BaseTableView：公共创建tableView方法
- (void) createTableViewWithStyle:(UITableViewStyle)style{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:style];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
//    [_tableView setSeparatorColor:kSeparatorColor];
//    [_tableView setBackgroundColor:kBackGroundColor];
    [_tableView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    [self.view addSubview:_tableView];
    [_tableView release];
    [_tableView setTableFooterView:[[[UIView alloc] init] autorelease]];
//    [_tableView setClipsToBounds:NO];
    
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;

}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

#pragma mark - UISearchBar

- (void) createSearchController{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.delegate = self;
    _searchController.searchBar.translucent = NO;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    self.definesPresentationContext = YES;
//    [_searchController.searchBar setBackViewColor:[UIColor whiteColor]];
//    [_searchController.searchBar setSearchTextFieldBackgroundColor:kBackGroundColor];
//
//
//    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kSkyBlueColor,NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    
    
    _tableView.tableHeaderView = _searchController.searchBar;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    return;
}

#pragma mark - TouchTableViewDelegate:touchTableView方法
-(void)touchTableViewtouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    return;
}

#pragma mark - UITableViewDataSouece:UITableView协议方法
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - UICollectionView
- (void)createCollectionViewWith:(UICollectionViewScrollDirection)scrollDirection andCellClass:(Class)cellClass andHeaderClass:(Class)headerClass andFooterClass:(Class)footerClass{
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:scrollDirection];
    [flowLayout setMinimumLineSpacing:1];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    [_collectionView registerClass:cellClass forCellWithReuseIdentifier:[cellClass description]];
    if (headerClass) {
        [_collectionView registerClass:headerClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[headerClass description]];
    }
    if (footerClass) {
        [_collectionView registerClass:footerClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[footerClass description]];
    }
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_collectionView];
    [_collectionView release];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 0;
}

#pragma mark - UINagategationCreate
- (void) createNavBar{
    
    
    
    
    
}

- (void) createLeftNavBtn{
    _leftNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftNavBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    UIBarButtonItem * leftItem =[[UIBarButtonItem alloc] initWithCustomView:_leftNavBtn];
    [_leftNavBtn addTarget:self action:@selector(leftNavBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    [_leftNavBtn sizeToFit];
    [leftItem release];
}

- (void) createRightNavBtn{
    _rightNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightNavBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_rightNavBtn addTarget:self action:@selector(rightNavBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightNavBtnClicked:)];
//    [tap setNumberOfTapsRequired:1];
//    [tap setNumberOfTouchesRequired:1];
//    [_rightNavBtn addGestureRecognizer:tap];
//    [tap release];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(rightNavBtnLongPressed:)];
    longPress.minimumPressDuration = 1; //定义按的时间
    [_rightNavBtn addGestureRecognizer:longPress];
    [longPress release];
    
    UIBarButtonItem * rightItem =[[UIBarButtonItem alloc] initWithCustomView:_rightNavBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    [_rightNavBtn sizeToFit];
    [rightItem release];
}

#pragma mark - UIImagePicker

- (void) getImageWithEdit:(BOOL)edit andType:(UIImagePickerControllerSourceType)type{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted ||author == ALAuthorizationStatusDenied){
        return;
    }
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    [picker setDelegate:self];
    [picker setSourceType:type];
    [picker setAllowsEditing:edit];
    [self presentViewController:picker animated:YES completion:nil];
    [picker release];
    
}

- (void) getImagesWithMaxNumber:(NSInteger)maxNumber{
    
}


#pragma mark - UIImagePickControllerDelegate

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * image = nil;
    if (picker.allowsEditing) {
        image = [info objectForKey:UIImagePickerControllerEditedImage];
        
    }else{
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    [self finishedChooseWithImages:@[image]];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 完成选择照片方法
- (void) finishedChooseWithImages:(NSArray *) images{
    return;
}


//#pragma mark - 录制视频
//- (void) recordVideoWithDuration:(float) duration{
//    EDWCameraViewController * cameraVC = [[EDWCameraViewController alloc] init];
//    [cameraVC setDuration:duration];
//    [cameraVC setDelegate:self];
//    [self presentViewController:cameraVC animated:YES completion:nil];
//    [cameraVC release];
//}
//
//#pragma mark - EDWCameraViewControllerDelegate
//- (void) finishCaptureWithVideoUrl:(NSURL *)videoUrl andPicUrl:(NSURL *)picUrl andSuccess:(BOOL)success{
//    if (success) {
//        [self finishRecordWithData:videoUrl andImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:picUrl]]];
//    }
//}
//#pragma mark - 完成录制
//- (void) finishRecordWithData:(NSURL *)videoUrl andImage:(UIImage *)image{
//    return;
//}

#pragma mark - UIAlertController

- (void) showCancelMessage:(NSString *)message{
    [self createAlertControllerWith:UIAlertControllerStyleAlert andTitle:nil andCancelTitle:@"知道了" andMessage:message andItemNames:nil andActions:nil andDestructiveNames:nil andDestructiveActions:nil andObject:nil];
}

- (UIAlertController *) createAlertControllerWith:(UIAlertControllerStyle)style
                          andTitle:(NSString *)title
                        andMessage:(NSString *)message
                      andItemNames:(NSArray *)names
                        andActions:(NSArray *)actions
               andDestructiveNames:(NSArray *)destructiveNames
             andDestructiveActions:(NSArray *)destructiveActions
{
    
    return [self createAlertControllerWith:style andTitle:title andCancelTitle:@"取消" andMessage:message andItemNames:names andActions:actions andDestructiveNames:destructiveNames andDestructiveActions:destructiveActions andObject:nil andMessageAlignment:NSTextAlignmentCenter];
}

- (UIAlertController *) createListAlertControllerWith:(UIAlertControllerStyle)style
                              andTitle:(NSString *)title
                            andMessage:(NSString *)message
                          andItemNames:(NSArray *)names
                            andActions:(NSArray *)actions
                   andDestructiveNames:(NSArray *)destructiveNames
                 andDestructiveActions:(NSArray *)destructiveActions
                          andIndexPath:(NSIndexPath *)indexPath{
    return [self createAlertControllerWith:style andTitle:title andCancelTitle:@"取消" andMessage:message andItemNames:names andActions:actions andDestructiveNames:destructiveNames andDestructiveActions:destructiveActions andObject:indexPath andMessageAlignment:NSTextAlignmentCenter];
}

- (UIAlertController *) createAlertControllerWith:(UIAlertControllerStyle)style
                          andTitle:(NSString *)title
                    andCancelTitle:(NSString *)cancelTitle
                        andMessage:(NSString *)message
                      andItemNames:(NSArray *)names
                        andActions:(NSArray *)actions
               andDestructiveNames:(NSArray *)destructiveNames
             andDestructiveActions:(NSArray *)destructiveActions
                         andObject:(id)andObject{
    return [self createAlertControllerWith:style andTitle:title andCancelTitle:cancelTitle andMessage:message andItemNames:names andActions:actions andDestructiveNames:destructiveNames andDestructiveActions:destructiveActions andObject:andObject andMessageAlignment:NSTextAlignmentCenter];
}


- (UIAlertController *) createAlertControllerWith:(UIAlertControllerStyle)style
                          andTitle:(NSString *)title
                    andCancelTitle:(NSString *)cancelTitle
                        andMessage:(NSString *)message
                      andItemNames:(NSArray *)names
                        andActions:(NSArray *)actions
               andDestructiveNames:(NSArray *)destructiveNames
             andDestructiveActions:(NSArray *)destructiveActions
                         andObject:(id)andObject
                andMessageAlignment:(NSTextAlignment)alignment{
    
    
    UIAlertController * actionSheet = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    
    
    
    
    if (cancelTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
        [actionSheet addAction:cancelAction];
    }
   
    for (int i=0; i<names.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:names[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self performSelector:NSSelectorFromString(actions[i]) withObject:andObject];
        }];
        [actionSheet addAction:action];
    }
    
    for (int i=0; i<destructiveNames.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:destructiveNames[i] style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self performSelector:NSSelectorFromString(destructiveActions[i]) withObject:andObject];
        }];
        [actionSheet addAction:action];
    }
    
//    if (message) {
//        NSMutableAttributedString *messageString = [[NSMutableAttributedString alloc] initWithString:message];
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        [paragraphStyle setAlignment:alignment];
//        [messageString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [messageString length])];
//        
//        [actionSheet setValue:messageString forKey:@"attributedMessage"];
//        
//        [messageString release];
//        [paragraphStyle release];
//    }
//    
    
    
//    UIView *subView1 = actionSheet.view.subviews[0];
//    UIView *subView2 = subView1.subviews[0];
//    UIView *subView3 = subView2.subviews[0];
//    UIView *subView4 = subView3.subviews[0];
//    UIView *subView5 = subView4.subviews[0];
//    UILabel * messageLabel = subView5.subviews[1];
//    messageLabel.textAlignment = alignment;
    
    
    
    
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    
    return actionSheet;
}



#pragma mark - UINavigationBtnClickEvent
- (void) rightNavBtnClicked:(UIButton *)sender{
    return;
}

- (void)rightNavBtnLongPressed:(UILongPressGestureRecognizer *) recognizer{
    return;
}

- (void) leftNavBtnClicked:(UIButton *)sender{
    return;
}

#pragma mark - MFMessageComposeViewController

- (void) sendSMSMessageWithMessage:(NSString *)message andTels:(NSArray *)tels{
    MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
    controller.recipients = tels;
    controller.body = message;
    [controller setMessageComposeDelegate:self];
    [self presentViewController:controller animated:YES completion:nil];
    [controller release];
}



#pragma mark - MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch ( result ) {
        case MessageComposeResultCancelled:
        {
            [controller dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case MessageComposeResultFailed:// send failed
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        case MessageComposeResultSent:
        {
            
            [controller dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

- (void) makeCallWithTel:(NSString *)tel{
    
    [self call:tel];
//    [self createAlertControllerWith:UIAlertControllerStyleAlert andTitle:kAlertTitle andCancelTitle:@"取消" andMessage:[NSString stringWithFormat:@"%@",tel] andItemNames:@[@"呼叫"] andActions:@[NSStringFromSelector(@selector(call:))] andDestructiveNames:nil andDestructiveActions:nil andObject:tel];
    
}

- (void) call:(NSString *)tel{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",tel]]];
}

- (void) showImageInfo:(NSString *)imageName{
    [self.infoImageBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.infoImageBtn setHidden:NO];
    
}

- (void) showImageInfo:(NSString *)imageName andText:(NSString *)text{
    [self.infoImageBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.infoImageBtn setTitle:text forState:UIControlStateNormal];
    
    
    //    CGFloat titleSize = [self.infoImageBtn.currentTitle sizeWithAttributes:@{NSFontAttributeName:self.infoImageBtn.titleLabel.font}].width;
    CGSize titleSize = [self.infoImageBtn.currentTitle boundingRectWithSize:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.infoImageBtn.titleLabel.font} context:nil].size;
    
    [self.infoImageBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.infoImageBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    [self.infoImageBtn setImageEdgeInsets:UIEdgeInsetsMake(self.infoImageBtn.frame.size.height/2 - self.infoImageBtn.imageView.frame.size.height / 2 - titleSize.height, self.infoImageBtn.frame.size.width/2-self.infoImageBtn.imageView.frame.size.width/2, 0, 0)];
    [self.infoImageBtn setTitleEdgeInsets:UIEdgeInsetsMake(self.infoImageBtn.imageView.frame.origin.y+self.infoImageBtn.imageView.frame.size.height + 10, self.infoImageBtn.frame.size.width/2-self.infoImageBtn.imageView.frame.size.width-titleSize.width/2, 0, 0)];
    [self.infoImageBtn setHidden:NO];
}

- (void) hideImageInfo{
    [self.infoImageBtn setHidden:YES];
}

- (void) getDataSource{
    return;
}


- (void) setNavBarTitleViewWithTitle:(NSString *)title AndImage:(UIImage *)image{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [btn sizeToFit];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width, 0, -btn.titleLabel.bounds.size.width)];
    [btn addTarget:self action:@selector(topNavBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setTitleView:btn];
}

- (void) topNavBtnClicked:(UIButton *)sender{
    return;
}

- (void)dealloc
{
    NSLog(@"%@---dealloc",NSStringFromClass([self class]));
    self.dataSource = nil;
    self.infoImageBtn = nil;
    [super dealloc];
}

@end
