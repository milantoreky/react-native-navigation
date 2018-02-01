//
//  RCCScaleFadeOutAnimator.m
//  TransitionTutorial
//
//  Created by Milan Toreky on 28/01/2018.
//  Copyright © 2018 artal. All rights reserved.
//

#import "RCCScaleFadeOutAnimator.h"

#define kTransitionDuration 0.3

@implementation RCCScaleFadeOutAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
	return kTransitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    fromViewController.view.alpha = 0.9;
    fromViewController.view.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        CGFloat scalingFactor = 0.9;
        fromViewController.view.alpha = 0.0;
        fromViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, scalingFactor, scalingFactor);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
