//
//  JLSpringTransitionAnimator.h
//  CustomTransitionsDemo
//
//  Created by Jose Luis Piedrahita on 15/09/14.
//  Copyright (c) 2014 Parallel Mobile. All rights reserved.
//

#import "JLSpringTransitionAnimator.h"

@implementation JLSpringTransitionAnimator

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.presenting) {
        // disable outgoing view controller interactions
        fromViewController.view.userInteractionEnabled = NO;
    
        // add incoming view controller view to container view
        toViewController.view.frame = [transitionContext initialFrameForViewController:fromViewController];
        [transitionContext.containerView addSubview:toViewController.view];
        
        // send incoming view controller view offscreen
        toViewController.view.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(toViewController.view.frame));
        
        // animate incoming view controller presentation
        [self animateTransitionWithAnimations:^{
            fromViewController.view.alpha = .5;
            toViewController.view.transform = CGAffineTransformIdentity;
        } transitionContext:transitionContext];
        
    } else {
        // enable incoming view controller interactions
        toViewController.view.userInteractionEnabled = YES;
        
        // animate outgoing view controller dismissal
        [self animateTransitionWithAnimations:^{
            toViewController.view.alpha = 1.;
            fromViewController.view.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(toViewController.view.frame));
        } transitionContext:transitionContext];
    }
}

-(void) animateTransitionWithAnimations:(dispatch_block_t) animations
                      transitionContext:(id <UIViewControllerContextTransitioning>) transitionContext
{
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.
         usingSpringWithDamping:.5
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveLinear
                     animations:animations
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
