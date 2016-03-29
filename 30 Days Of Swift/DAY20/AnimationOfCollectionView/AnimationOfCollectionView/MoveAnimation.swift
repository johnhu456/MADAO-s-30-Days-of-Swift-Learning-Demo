//
//  MoveAnimation.swift
//  AnimationOfCollectionView
//
//  Created by MADAO on 16/3/29.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class MoveAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! DetailViewController
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! ViewController
        let containView = transitionContext.containerView()
        
        //获取当前点击的Cell
        let indexPath = fromViewController.collectionView.indexPathsForSelectedItems()![0]
        let cell = fromViewController.collectionView.cellForItemAtIndexPath(indexPath) as! CustomCollectionViewCell
        let snapShotView = cell.imageView .snapshotViewAfterScreenUpdates(false)
        containView?.addSubview((toViewController.view)!)
        containView?.addSubview(snapShotView)
        
        snapShotView.frame = (cell.convertRect(cell.imageView.frame, toView: cell.superview!.superview))
        snapShotView.frame = CGRectMake(snapShotView.frame.origin.x, snapShotView.frame.origin.y + 64, snapShotView.frame.size.width, snapShotView.frame.size.height)

        cell.imageView.hidden = true
        
        //设置第二个控制器位置，透明度
        toViewController.view.frame = transitionContext .finalFrameForViewController(toViewController)
        toViewController.view.alpha = 0
    

        //动画
        UIView.animateWithDuration(self.transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: UIViewAnimationOptions.CurveLinear, animations: {
            toViewController.view.alpha = 1
            snapShotView.frame = (toViewController.view?.convertRect(toViewController.detailImageView.frame, toView: toViewController.view.superview))!
            
            }) { (success) in
                toViewController.detailImageView.hidden = false;
                cell.imageView.hidden = false;
                snapShotView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
