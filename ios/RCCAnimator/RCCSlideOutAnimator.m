//
//  RCCSlideOutAnimator.m
//  ReactNativeNavigation
//
//  Created by Milan Toreky on 28/01/2018.
//  Copyright © 2018 artal. All rights reserved.
//

#import "RCCSlideOutAnimator.h"

#define kTransitionDuration 0.3

@implementation RCCSlideOutAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return kTransitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    toViewController.view.transform = CGAffineTransformMakeTranslation(-fromViewController.view.frame.size.width, 0);
    fromViewController.view.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.transform = CGAffineTransformIdentity;
        fromViewController.view.transform = CGAffineTransformMakeTranslation(fromViewController.view.frame.size.width, 0);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
