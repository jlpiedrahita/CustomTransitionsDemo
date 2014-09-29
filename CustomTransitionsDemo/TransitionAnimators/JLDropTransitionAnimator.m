//
//  JLDropTransitionAnimator.h
//  CustomTransitionsDemo
//
//  Created by Jose Luis Piedrahita on 19/09/14.
//  Copyright (c) 2014 Parallel Mobile. All rights reserved.
//

#import "JLDropTransitionAnimator.h"

@interface JLDropTransitionAnimator ()
@property (strong, nonatomic) id<UIViewControllerContextTransitioning> transitionContext;
@property (strong, nonatomic) UIDynamicAnimator *dynamicAnimator;
@end

@implementation JLDropTransitionAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.5;
}

-(void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    [self.transitionContext completeTransition:YES];
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:transitionContext.containerView];
    self.dynamicAnimator.delegate = self;

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.presenting) {
        
        CGRect initialFrame = [transitionContext initialFrameForViewController:fromViewController];
        toViewController.view.frame = CGRectOffset(initialFrame, 0, -initialFrame.size.height);
        [transitionContext.containerView addSubview:toViewController.view];
        
        UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[toViewController.view]];
        gravityBehavior.magnitude = 4;
        [self.dynamicAnimator addBehavior:gravityBehavior];
        
        UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[toViewController.view]];
        [collisionBehavior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(-initialFrame.size.height, 0, 0, 0)];
        
        [self.dynamicAnimator addBehavior:collisionBehavior];

        [UIView animateWithDuration:.5 animations:^{
            fromViewController.view.alpha = .5;
        }];

    } else {
        
        UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[fromViewController.view]];
        gravityBehavior.magnitude = 8;
        [self.dynamicAnimator addBehavior:gravityBehavior];

        CGRect initialFrame = [transitionContext initialFrameForViewController:fromViewController];
        UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[fromViewController.view]];
        [collisionBehavior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(0, 0, -initialFrame.size.height, 0)];
        [self.dynamicAnimator addBehavior:collisionBehavior];
        
        [UIView animateWithDuration:.5 animations:^{
            toViewController.view.alpha = 1.;
        }];
    }
}

@end
