//
//  CustomAlertView.m
//  CustomAlert
//
//  Created by unchi on 2013/12/27.
//  Copyright (c) 2013年 unchi. All rights reserved.
//
//  @version 1.0.2
//

#import "UNCCustomAlertView.h"


@interface UNCCustomAlertView ()

@property UIView* mask;
@property UIView* dialog;
@property bool isClose;

@end

@implementation UNCCustomAlertView

static NSMutableArray* _pools = nil;

+(void)initialize {
    if (_pools == nil) {
        _pools = [[NSMutableArray alloc] init];
    }
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        
        NSString *nibName = (nibNameOrNil) ? nibNameOrNil : NSStringFromClass([self class]);
        UINib *nib = [UINib nibWithNibName:nibName bundle:nibBundleOrNil];
        [nib instantiateWithOwner:self options:nil];

        _isClose = false;
        _isAllowDuplicateBackground = true;
    
        // 勝手に解放されないように
        [_pools addObject:self];
    }

    return self;
}

-(void)show {
    
    _isClose = false;
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    CGFloat w = window.frame.size.width;
    CGFloat h = window.frame.size.height;

    if (_backgroundView == nil) {
        _mask = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        _mask.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 0.75f];
        _mask.layer.opacity = 0;
    } else {
        _mask = _backgroundView;
        _mask.frame = CGRectMake(0, 0, w, h);
        _mask.layer.opacity = 0;
    }
    
    _dialog = self.view;
    _dialog.center = window.rootViewController.view.center;
    _dialog.layer.opacity = 0.5f;
    _dialog.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);

    
    if (_isAllowDuplicateBackground || _pools.count == 1) {
        [window addSubview:_mask];
    }
    
    [window addSubview:_dialog];
    [window bringSubviewToFront:_dialog];
    
    [UIView animateWithDuration:0.2f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                    
                         _mask.layer.opacity = 1.0f;

                         _dialog.layer.opacity = 1.0f;
                         _dialog.layer.transform = CATransform3DMakeScale(1, 1, 1);
                     }
                     completion:nil];
}

- (void)didPushButton:(id)sender {
    if (_click) {
        _click(self, sender);
    }
}

- (void)close {
    if (_isClose) return;
    _isClose = true;
    
    CATransform3D currentTransform = _dialog.layer.transform;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
					 animations:^{
                         
                         _mask.layer.opacity = 0.0f;

                         _dialog.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6f, 0.6f, 1.0));
                         _dialog.layer.opacity = 0.0f;
					 }
					 completion:^(BOOL finished) {

                         [_mask removeFromSuperview];
                         [_dialog removeFromSuperview];
                         
                         if (_complete) {
                             _complete(self);
                         }
					 }
	 ];
    
    [_pools removeObject:self];
}

- (CGPoint)windowCenter {
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    return window.rootViewController.view.center;
}

@end
