//
//  ViewController.m
//  CustomAlert
//
//  Created by unchi on 2014/02/12.
//  Copyright (c) 2014年 unchi. All rights reserved.
//
// @version 1.0.1
//

#import "ViewController.h"

#import "Sample2CustomAlertView.h"
#import "UNCCustomAlertView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didPush1:(id)sender {
    
    [self showSample];
}

- (IBAction)didPush2:(id)sender {
    
    [self showSample2];
}

- (void)showSample {
    
    UIView* bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor colorWithRed:0.5f green:1.0f blue:0.5f alpha:0.5f];

    UNCCustomAlertView* a = [[UNCCustomAlertView alloc] initWithNibName:@"Sample1CustomAlertView" bundle:nil];
    a.backgroundView = bg;
    a.click = ^(UNCCustomAlertView* view, id sender){
        [view close];
    };
    a.complete = ^(UNCCustomAlertView* view){
        NSLog (@"end");
    };

    
    [a show];
}

- (void)showSample2 {

    Sample2CustomAlertView* a = [[Sample2CustomAlertView alloc] init];

    a.message = @"こんにちは世界！\nこんばんは世界！";
    a.subject = @"サンプルアラート";
    a.click = ^(UNCCustomAlertView* view, id sender){
        NSLog (@"%ld", (long)[(UIButton*)sender tag]);
        [view close];
    };
    a.complete = ^(UNCCustomAlertView* view){
        NSLog (@"end2");
    };

    [a show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
