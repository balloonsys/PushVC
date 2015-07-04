//
//  NavController.m
//  PushVC
//
//  Created by Linkou Bian on 7/4/15.
//  Copyright (c) 2015 Balloonsys Inc. All rights reserved.
//

#import "NavController.h"

@interface NavController () <UINavigationControllerDelegate>

@end

@implementation NavController

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
    self = [super awakeAfterUsingCoder:aDecoder];
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

#pragma mark - UINavigationControllerDelegate Methods

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    self.inTransition = YES;
}


- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate {
    self.inTransition = NO;
}

@end
