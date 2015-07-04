//
//  BaseItem.h
//  PushVC
//
//  Created by Linkou Bian on 7/4/15.
//  Copyright (c) 2015 Balloonsys Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)();

@interface BaseItem : UIView

/** The tap gesture recogniser used for <onTap> blocks and the <tapped> method. */
@property (nonatomic, retain) UITapGestureRecognizer *tapper;

/** Boolean to toggle the tap gesture recogniser on and off. */
@property (nonatomic, assign) BOOL tappable;

/**
 A block assigned to this property to will be executed when <tapper> registers a
 tap.
 */
@property (nonatomic, copy) Block onTap;

/**
 * This method fires when <tapper> registers a tap. The default implementation
 * executes the <onTap> block.
 */
- (void)tapped;

@end
