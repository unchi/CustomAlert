//
//  CustomAlertView.h
//  CustomAlert
//
//  Created by unchi on 2013/12/27.
//  Copyright (c) 2013年 unchi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UNCCustomAlertView : UIViewController

typedef void(^UNCCustomAlertViewClickBlock)(UNCCustomAlertView *alertView, id sender);
typedef void(^UNCCustomAlertViewCompleteBlock)(UNCCustomAlertView *alertView);


/** 表示する view を設定 */
//@property (strong, nonatomic) IBOutlet UIView* view;
/** 表示する Background view を設定 */
@property (strong, nonatomic) IBOutlet UIView* backgroundView;

/** 選択 コールバック設定 */
@property (copy, nonatomic) UNCCustomAlertViewClickBlock click;
/** 終了 コールバック設定 */
@property (copy, nonatomic) UNCCustomAlertViewCompleteBlock complete;

/** 表示済みの場合 背景を表示するか */
@property bool isAllowDuplicateBackground;


/** ボタンを紐付ける */
- (IBAction)didPushButton:(id)sender;
/** xib から初期化 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

/** 表示 */
- (void)show;
/** 閉じる */
- (void)close;


- (CGPoint)windowCenter;

@end
