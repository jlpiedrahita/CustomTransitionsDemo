//
//  JLBaseTransitionAnimator.m
//  CustomTransitionsDemo
//
//  Created by Jose Luis Piedrahita on 22/09/14.
//  Copyright (c) 2014 Parallel Mobile. All rights reserved.
//

#import "JLBaseTransitionAnimator.h"

static const NSTimeInterval kDefaultTransitionDuration = .5;

@implementation JLBaseTransitionAnimator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return kDefaultTransitionDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end
