//
//  DismissingAnimationController.m
//  AskBrotherApp
//
//  Created by xuyong on 16/12/21.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import "DismissingAnimationController.h"
#import "POP.h"

@interface DismissingAnimationController()

@end

@implementation DismissingAnimationController
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toView.userInteractionEnabled = YES;
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    
    
    POPBasicAnimation *closeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    closeAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y)];//[NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
    closeAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y)];//@(-fromView.layer.position.y);
    [closeAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation *scaleDownAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleDownAnimation.springBounciness = 1;
    scaleDownAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    
    [fromView.layer pop_addAnimation:closeAnimation forKey:@"closeAnimation"];
    [fromView.layer pop_addAnimation:scaleDownAnimation forKey:@"scaleDown"];
    
}
@end
