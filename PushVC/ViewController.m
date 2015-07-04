//
//  ViewController.m
//  PushVC
//
//  Created by Linkou Bian on 7/4/15.
//  Copyright (c) 2015 Balloonsys Inc. All rights reserved.
//

#import "ViewController.h"
#import "MenuItem.h"

@interface ViewController ()

@property (nonatomic, strong) MenuItem *greenItem;
@property (nonatomic, strong) MenuItem *purpleItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.greenItem];
    [self.view addSubview:self.purpleItem];
}

#pragma mark - Properties

- (MenuItem *)greenItem {
    if (!_greenItem) {
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat itemWidth = (screenWidth - 20 * 3) * 0.5;
        
        _greenItem = [[MenuItem alloc] initWithFrame:CGRectMake(20, 100, itemWidth, 100)];
        _greenItem.backgroundColor = [UIColor greenColor];
        _greenItem.iconView.image = [UIImage imageNamed:@"building"];
        
        __weak typeof(self) weakSelf = self;
        _greenItem.onTap = ^{
            UIViewController *greeVC = [[UIViewController alloc] init];
            greeVC.view.backgroundColor = [UIColor greenColor];
            greeVC.title = @"Green";
            
            [weakSelf.navigationController pushViewController:greeVC animated:YES];
        };
    }
    
    return _greenItem;
}

- (MenuItem *)purpleItem {
    if (!_purpleItem) {
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat itemWidth = (screenWidth - 20 * 3) * 0.5;
        
        _purpleItem = [[MenuItem alloc] initWithFrame:CGRectMake(20 + itemWidth + 20, 100, itemWidth, 100)];
        _purpleItem.backgroundColor = [UIColor purpleColor];
        _purpleItem.iconView.image = [UIImage imageNamed:@"house"];
        
        __weak typeof(self) weakSelf = self;
        _purpleItem.onTap = ^{
            UIViewController *purpleVC = [[UIViewController alloc] init];
            purpleVC.view.backgroundColor = [UIColor purpleColor];
            purpleVC.title = @"Purple";
            
            [weakSelf.navigationController pushViewController:purpleVC animated:YES];
        };
    }
    
    return _purpleItem;
}

@end
