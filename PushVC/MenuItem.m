//
//  MenuItem.m
//  PushVC
//
//  Created by Linkou Bian on 7/4/15.
//  Copyright (c) 2015 Balloonsys Inc. All rights reserved.
//

#import "MenuItem.h"

#define TAP_ANIMATION_KEY       @"ICON_ANIMATION_ON_TAP"

@implementation MenuItem

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _iconView = [[UIImageView alloc] init];
        
        [self addSubview:_iconView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [self.iconView sizeToFit];
    self.iconView.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
}

#pragma mark - Override Methods

- (void)tapped {
    
    if (self.iconView) {
        if ([self.iconView.layer animationForKey:TAP_ANIMATION_KEY] == nil) {
            [self.iconView.layer addAnimation:[self tapAnimation] forKey:TAP_ANIMATION_KEY];

            [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
            self.inAnimating = YES;
            
        } else {
            NSLog(@"Do NOT tap until animation for %@ stopped", self);
        }
    } else {
        [super tapped];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    self.inAnimating = NO;
    
    [super tapped];
}

- (CAAnimation *)tapAnimation {
    
    CABasicAnimation *scaleAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)];
    scaleAni.duration = 0.1;
    scaleAni.autoreverses = YES;
    scaleAni.cumulative = YES;
    scaleAni.repeatCount = 1.0;
    scaleAni.delegate = self;
    
    return scaleAni;
}

@end
