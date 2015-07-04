//
//  BaseItem.m
//  PushVC
//
//  Created by Linkou Bian on 7/4/15.
//  Copyright (c) 2015 Balloonsys Inc. All rights reserved.
//

#import "BaseItem.h"

@implementation BaseItem

- (void)setOnTap:(Block)onTap {
    _onTap = [onTap copy];
    if (_onTap) {
        self.tappable = YES;
    }
}

- (void)setTappable:(BOOL)can {
    if (_tappable == can) {
        return;
    }
    
    _tappable = can;
    if (can) {
        [self addGestureRecognizer:self.tapper];
    } else if (self.tapper) {
        [self removeGestureRecognizer:self.tapper];
    }
}

- (UITapGestureRecognizer *)tapper {
    if (!_tapper) {
        _tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    }
    return _tapper;
}

- (void)tapped {
    if (self.onTap) {
        self.onTap();
    }
}

@end
