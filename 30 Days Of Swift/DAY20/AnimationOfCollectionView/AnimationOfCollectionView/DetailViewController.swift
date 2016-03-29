//
//  DetailViewController.swift
//  AnimationOfCollectionView
//
//  Created by MADAO on 16/3/29.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailBrief: UITextView!
    
    var detailModel:CustomModel?
    
    var percentTransition:UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = UIImage(named: (detailModel!.imageName)!)
        detailTitle.text = detailModel!.title
        detailBrief.text = detailModel!.brief
        
        self.setupGestureRecognizer()
        self.navigationController?.delegate = self
    }

    func setupGestureRecognizer() {
        //设置手势及其方位
        let edgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self,action: #selector(DetailViewController.edgePanGesture(_:)))
        edgeGestureRecognizer.edges = UIRectEdge.Left
        self.view.addGestureRecognizer(edgeGestureRecognizer)
    }
    
    func edgePanGesture(gestureRecognizer:UIScreenEdgePanGestureRecognizer) {
        var progress = gestureRecognizer.translationInView(self.view).x/self.view.frame.size.width
        progress = min(1.0, max(0.0, progress))
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began{
            percentTransition = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewControllerAnimated(true)
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Changed{
            percentTransition?.updateInteractiveTransition(progress)
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Cancelled || gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if progress > 0.1
            {
                percentTransition?.finishInteractiveTransition()
            }
            else
            {
                percentTransition?.cancelInteractiveTransition()
            }
        }
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if toVC.isKindOfClass(ViewController)
        {
            return MoveInverseTransition()
        }
        else{
            return nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController.isKindOfClass(MoveInverseTransition)
        {
            return percentTransition
        }
        else
        {
            return nil
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
