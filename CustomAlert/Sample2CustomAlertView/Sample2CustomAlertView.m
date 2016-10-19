//
//  CustomAlertView2.m
//  CustomAlert
//
//  Created by unchi on 2014/02/12.
//  Copyright (c) 2014年 unchi. All rights reserved.
//

#import "Sample2CustomAlertView.h"

@interface Sample2CustomAlertView ()

@property (weak, nonatomic) IBOutlet UILabel *textSubject;
@property (weak, nonatomic) IBOutlet UILabel *textMessage;


@end

@implementation Sample2CustomAlertView

- (id)init {
    self = [super initWithNibName:@"Sample2CustomAlertView" bundle:nil];
    if (self != nil) {
        self.view.layer.cornerRadius = 5.f;
    }
    
    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _textSubject.text = _subject;
    _textMessage.text = _message;
    
    const float b = _textMessage.frame.size.height;
    [_textMessage sizeToFit];
    
    const float a = _textMessage.frame.size.height;
    const float d = a - b;
    
    CGRect frame = CGRectMake(0, 0,
                              self.view.frame.size.width,
                              self.view.frame.size.height + d);

    self.view.frame = frame;
    self.view.center = [self windowCenter];
}

@end
