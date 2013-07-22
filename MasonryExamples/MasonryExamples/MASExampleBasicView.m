//
//  MASExampleBasicView.m
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASExampleBasicView.h"

@implementation MASExampleBasicView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UIView *view1 = UIView.new;
    view1.backgroundColor = UIColor.greenColor;
    view1.layer.borderColor = UIColor.blackColor.CGColor;
    view1.layer.borderWidth = 2;
    [self addSubview:view1];
    
    UIView *view2 = UIView.new;
    view2.backgroundColor = UIColor.redColor;
    view2.layer.borderColor = UIColor.blackColor.CGColor;
    view2.layer.borderWidth = 2;
    [self addSubview:view2];
    
    UIView *view3 = UIView.new;
    view3.backgroundColor = UIColor.blueColor;
    view3.layer.borderColor = UIColor.blackColor.CGColor;
    view3.layer.borderWidth = 2;
    [self addSubview:view3];
    
    UIView *superview = self;
    int padding = 10;
    
    [view1 mas_buildConstraints:^(MASConstraintBuilder *constraints) {
        constraints.top.equal(superview.mas_top).offset(padding);
        constraints.left.equal(superview.mas_left).offset(padding);
        constraints.bottom.equal(view3.mas_top).offset(-padding);
        constraints.right.equal(view2.mas_left).offset(-padding);
        constraints.width.equal(view2.mas_width);
        
        //you can chain same attribute
        constraints.height
            .equal(view2.mas_height)
            .equal(view3.mas_height);
    }];
    
    [view2 mas_buildConstraints:^(MASConstraintBuilder *constraints) {
        constraints.top.equal(superview.mas_top).offset(padding);
        constraints.left.equal(view1.mas_right).offset(padding);
        constraints.bottom.equal(view3.mas_top).offset(-padding);
        constraints.right.equal(superview.mas_right).offset(-padding);
        constraints.width.equal(view1.mas_width);
        
        //or define it multiple times
        constraints.height.equal(view1.mas_height);
        constraints.height.equal(view3.mas_height);
    }];
    
    [view3 mas_buildConstraints:^(MASConstraintBuilder *constraints) {
        constraints.top.equal(view1.mas_bottom).offset(padding);
        constraints.left.equal(superview.mas_left).offset(padding);
        constraints.bottom.equal(superview.mas_bottom).offset(-padding);
        constraints.right.equal(superview.mas_right).offset(-padding);
        
        //TODO or pass an array
        //constraints.height.equal(superview.subviews);
        constraints.height.equal(view1.mas_height);
        constraints.height.equal(view2.mas_height);
    }];
    
    return self;
}

@end
