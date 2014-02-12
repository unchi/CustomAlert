//
//  ViewController.m
//  CustomAlert
//
//  Created by unchi on 2014/02/12.
//  Copyright (c) 2014年 unchi. All rights reserved.
//

#import "ViewController.h"

#import "Sample2CustomAlertView.h"
#import "CustomAlertView.h"


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

    CustomAlertView* a = [[CustomAlertView alloc] initWithNibName:@"Sample1CustomAlertView" bundle:nil];
    a.backgroundView = bg;
    a.click = ^(CustomAlertView* view, id sender){
        [view close];
    };
    a.complete = ^(CustomAlertView* view){
        NSLog (@"end");
    };

    
    [a show];
}

- (void)showSample2 {

    Sample2CustomAlertView* a = [[Sample2CustomAlertView alloc] init];

    a.message = @"こんにちは世界！\nこんばんは世界！";
    a.title = @"サンプルアラート";
    a.click = ^(CustomAlertView* view, id sender){
        NSLog (@"%d", [(UIButton*)sender tag]);
        [view close];
    };
    a.complete = ^(CustomAlertView* view){
        NSLog (@"end2");
    };

    [a show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
