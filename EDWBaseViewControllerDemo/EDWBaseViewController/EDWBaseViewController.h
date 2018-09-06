//
//  EDWBaseViewController.h
//  ttjd
//
//  Created by easyshare on 16/5/14.
//  Copyright © 2016年 yizixuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDWBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UISearchResultsUpdating>

{
    UITableView * _tableView;
    UICollectionView * _collectionView;
    UIButton * _leftNavBtn;
    UIButton * _rightNavBtn;
    UISearchController * _searchController;
}

@property (assign,nonatomic) UIButton * infoImageBtn;

- (void) showCancelMessage:(NSString *)message;

/**
 *  创建数据源
 */
- (void) createDataSource;


/**
 *  创建表格
 *
 *  @param style
 */
- (void) createTableViewWithStyle:(UITableViewStyle)style;

/**
 *  创建searchController
 */
- (void) createSearchController;

- (void)createCollectionViewWith:(UICollectionViewScrollDirection)scrollDirection andCellClass:(Class)cellClass andHeaderClass:(Class)headerClass andFooterClass:(Class)footerClass;

/**
 *  初始化UI
 */
- (void) createUI;

/**
 *  通用数据源
 */
@property (retain,nonatomic) NSMutableArray * dataSource;


- (void) createNavBar;

/**
 *  创建左侧自定义导航按钮
 */
- (void) createLeftNavBtn;

/**
 *  创建右侧自定义导航按钮
 */
- (void) createRightNavBtn;

/**
 *  Nav右边点击按钮点击方法
 *
 *  @param sender
 */
- (void) rightNavBtnClicked:(UIButton *)sender;


- (void) rightNavBtnLongPressed:(UILongPressGestureRecognizer *) recognizer;

/**
 *  Nav左边点击按钮点击方法
 *
 *  @param sender
 */
- (void) leftNavBtnClicked:(UIButton *)sender;

/**
 *  获取单张照片统一方法
 *
 *  @param edit 是否可以修改
 *  @param type 照片来源
 */
- (void) getImageWithEdit:(BOOL)edit andType:(UIImagePickerControllerSourceType)type;

/**
 *  获取多张照片统一方法
 *
 *  @param maxNumber 最大数限制
 */
- (void) getImagesWithMaxNumber:(NSInteger)maxNumber;

/**
 *  创建alert
 *
 *  @param style   样式
 *  @param title   标题
 *  @param message 信息
 *  @param names   按钮标题
 *  @param actions 执行方法
 */
- (UIAlertController *) createAlertControllerWith:(UIAlertControllerStyle)style
                          andTitle:(NSString *)title
                        andMessage:(NSString *)message
                      andItemNames:(NSArray *)names
                        andActions:(NSArray *)actions
               andDestructiveNames:(NSArray*)destructiveNames
             andDestructiveActions:(NSArray *)destructiveActions;

/**
 *  创建List alert
 *
 *  @param style   样式
 *  @param title   标题
 *  @param message 信息
 *  @param names   按钮标题
 *  @param actions 执行方法
 *  @param indexPath 执行方法
 */
- (UIAlertController *) createListAlertControllerWith:(UIAlertControllerStyle)style
                          andTitle:(NSString *)title
                        andMessage:(NSString *)message
                      andItemNames:(NSArray *)names
                        andActions:(NSArray *)actions
               andDestructiveNames:(NSArray*)destructiveNames
             andDestructiveActions:(NSArray *)destructiveActions
                      andIndexPath:(NSIndexPath *)indexPath;


- (UIAlertController *) createAlertControllerWith:(UIAlertControllerStyle)style
                          andTitle:(NSString *)title
                    andCancelTitle:(NSString *)cancelTitle
                        andMessage:(NSString *)message
                      andItemNames:(NSArray *)names
                        andActions:(NSArray *)actions
               andDestructiveNames:(NSArray*)destructiveNames
             andDestructiveActions:(NSArray *)destructiveActions
                         andObject:(id)andObject;

- (UIAlertController *) createAlertControllerWith:(UIAlertControllerStyle)style
                          andTitle:(NSString *)title
                    andCancelTitle:(NSString *)cancelTitle
                        andMessage:(NSString *)message
                      andItemNames:(NSArray *)names
                        andActions:(NSArray *)actions
               andDestructiveNames:(NSArray*)destructiveNames
             andDestructiveActions:(NSArray *)destructiveActions
                         andObject:(id)andObject
               andMessageAlignment:(NSTextAlignment)alignment;


/**
 *  完成照片选择
 *
 *  @param images 图片数组
 */
- (void) finishedChooseWithImages:(NSArray *) images;


/**
 *  录制视频
 *
 *  @param duration 时长
 */
//- (void) recordVideoWithDuration:(float) duration;

/**
 *  完成录制视频
 *
 *  @param video 视频
 *  @param image 截图
 */
//- (void) finishRecordWithData:(NSURL *)videoUrl andImage:(UIImage *)image;

/**
 *  发送短信
 *
 *  @param message 消息
 *  @param tels    电话
 */
- (void) sendSMSMessageWithMessage:(NSString *)message andTels:(NSArray *)tels;

/**
 *  打电话
 *
 *  @param tel 电话号码
 */
- (void) makeCallWithTel:(NSString *)tel;

//- (void) goChatWithHXUserName:(NSString *)username andChatType:(NIMSessionType)type;


/**
 *  获取下拉刷新头部
 *
 *  @param target 目标
 *  @param action 方法
 *
 *  @return 头部试图
 */
//- (MJRefreshHeader *) getRefreshHeaderWithTarget:(id)target andAction:(SEL)action;


/**
 *  获取上拉加载尾部
 *
 *  @param target 目标
 *  @param action 方法
 *
 *  @return 尾部试图
 */
//- (MJRefreshFooter *) getRefreshFooterWithTarget:(id)target andAction:(SEL)action;



/**
 *  打开图片
 *
 *  @param imageUrls 图片url数组
 *  @param index     当前图片
 */
//- (void) openImagesWithImageUrls:(NSArray *)imageUrls andCurrentIndex:(NSInteger)index;

/**
 *  打开图片
 *
 *  @param imageUrls 图片url数组
 *  @param index     当前图片
 *  @param imageView 图片视图
 */
//- (void) openImagesWithImageUrls:(NSArray *)imageUrls andCurrentIndex:(NSInteger)index andCurrentImageView:(UIImageView *)imageView;

/**
 *  打开图片
 *
 *  @param imageUrls 图片URL数组
 *  @param images    替模图片
 *  @param index     当前图片
 *  @param view      图片视图
 */
//- (void) openImagesWithImageUrls:(NSArray *)imageUrls andPlaceHolderImages:(NSArray *)images andCurrentIndex:(NSInteger)index andCurrentImageView:(UIView *)view;

/**
 *  打开图片
 *
 *  @param images UIImage数组
 *  @param index  当前图片
 */
//- (void) openImagesWithImages:(NSArray *)images andCurrentIndex:(NSInteger)index;

/**
 *  打开图片
 *
 *  @param images                图片数组
 *  @param index                 当前图片
 *  @param url                   图片视图
 */
//- (void) openImagesWithImages:(NSArray *)images andCurrentIndex:(NSInteger)index andCurrentImageView:(UIView *)view;

/**
 *  打开视频
 *
 *  @param url 视频URL
 */
//- (void) openVideoWithVideoUrl:(NSURL *)url;


/**
 *  打开文件
 *
 *  @param url      文件URL
 *  @param fileType 文件类型
 */
//- (void) openFileWithUrl:(NSURL *)url andFileType:(NSString *)fileType andFileSize:(float)fileSize;

/**
 *  打开文件
 *
 *  @param url      文件URL
 *  @param fileType 文件类型
 */
//- (void) openFileWithUrl:(NSURL *)url andFileType:(NSString *)fileType andFileSize:(float)fileSize andTitle:(NSString *)title;


/**
 *  显示图片信息
 *
 *  @param imageName 图片名字
 */
- (void) showImageInfo:(NSString *)imageName;


- (void) showImageInfo:(NSString *)imageName andText:(NSString *)text;

/**
 *  隐藏图片信息
 */
- (void) hideImageInfo;


/**
 *  获取数据
 */
- (void) getDataSource;


//- (void) createHeaderSegmentedControlWith:(NSArray *)items andCGRect:(CGRect)rect andTarget:(id)target andAction:(SEL)action;


- (void) setNavBarTitleViewWithTitle:(NSString *)title AndImage:(UIImage *)image;

- (void) topNavBtnClicked:(UIButton *)sender;


//- (void) openUrlWithUrlString:(NSString *)url;




//- (void) createTopDoubleViewWithFrame:(CGRect)frame
//                         andLeftTitle:(NSString *)leftTitle
//                        andRightTitle:(NSString *)rightTitle
//                         andLeftImage:(UIImage *)leftImage
//                        andRightImage:(UIImage *)rightImage
//                          andWithLine:(BOOL)line;

@end
