//
//  PresentingAnimationController.m
//  AskBrotherApp
//
//  Created by xuyong on 16/12/21.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import "PresentingAnimationController.h"
#import "POP.h"


@interface PresentingAnimationController()

@end

@implementation PresentingAnimationController
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
//    toView.frame = CGRectMake(0,
//                              0,
//                              CGRectGetWidth(transitionContext.containerView.bounds) - 100.f,
//                              CGRectGetHeight(transitionContext.containerView.bounds) - 280.f);
    toView.frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(transitionContext.containerView.bounds) ,
                              CGRectGetHeight(transitionContext.containerView.bounds));

    
    CGPoint p = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    toView.center = p;
    
    [transitionContext.containerView addSubview:toView];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y)];//[NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y)];//@(transitionContext.containerView.center.y);
    positionAnimation.springBounciness = 8;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 8;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];//[NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
    
    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    
}
@end
