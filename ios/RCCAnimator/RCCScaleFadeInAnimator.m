//
//  RCCScaleFadeInAnimator.m
//  TransitionTutorial
//
//  Created by Milan Toreky on 28/01/2018.
//  Copyright © 2018 artal. All rights reserved.
//

#import "RCCScaleFadeInAnimator.h"

#define kTransitionDuration 0.3

@implementation RCCScaleFadeInAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
	return kTransitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGFloat scalingFactor = 0.9;
    toViewController.view.alpha = 0.0;
    toViewController.view.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    toViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, scalingFactor, scalingFactor);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        toViewController.view.alpha = 1.0;
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
