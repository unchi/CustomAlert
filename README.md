CustomAlert
===========

アラートを xib ファイルでカスタマイズ出来ます。

継承し拡張すれば、あらゆるデザインに対応出来ます。

表示、非表示アニメーションのカスタマイズが出来ないので、
今後改良したいと思います。

```
    UIView* bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor colorWithRed:0.5f green:1.0f blue:0.5f alpha:0.5f];

    UNCCustomAlertView* a = [[UNCCustomAlertView alloc] initWithNibName:@"Sample1CustomAlertView" bundle:nil];
    a.backgroundView = bg;
    a.click = ^(UNCCustomAlertView* view, id sender){
        NSLog (@"%d", [(UIButton*)sender tag]);
        [view close];
    };
    a.complete = ^(UNCCustomAlertView* view){
        NSLog (@"end");
    };

    [a show];
```

