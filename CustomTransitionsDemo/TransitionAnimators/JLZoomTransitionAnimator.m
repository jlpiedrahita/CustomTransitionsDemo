//
//  JLZoomTransitionAnimator.m
//  CustomTransitionsDemo
//
//  Created by Jose Luis Piedrahita on 22/09/14.
//  Copyright (c) 2014 Parallel Mobile. All rights reserved.
//

#import "JLZoomTransitionAnimator.h"

@implementation JLZoomTransitionAnimator

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.presenting) {
        fromViewController.view.userInteractionEnabled = NO;
        
        toViewController.view.frame = [transitionContext initialFrameForViewController:fromViewController];
        [transitionContext.containerView addSubview:toViewController.view];
        
        toViewController.view.transform = CGAffineTransformMakeScale(.2, .2);
        toViewController.view.alpha = 0;
        
        [self animateTransitionWithAnimations:^{
            fromViewController.view.alpha = .5;
            
            toViewController.view.alpha = 1;
            toViewController.view.transform = CGAffineTransformIdentity;
        } transitionContext:transitionContext];
        
    } else {
        toViewController.view.userInteractionEnabled = YES;
        
        [self animateTransitionWithAnimations:^{
            toViewController.view.alpha = 1.;
            fromViewController.view.transform = CGAffineTransformMakeScale(.2, .2);
            fromViewController.view.alpha = 0;
        } transitionContext:transitionContext];
    }
}

-(void) animateTransitionWithAnimations:(dispatch_block_t) animations
                      transitionContext:(id <UIViewControllerContextTransitioning>) transitionContext
{
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.
         usingSpringWithDamping:.75
          initialSpringVelocity:0.
                        options:UIViewAnimationOptionCurveLinear
                     animations:animations
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
