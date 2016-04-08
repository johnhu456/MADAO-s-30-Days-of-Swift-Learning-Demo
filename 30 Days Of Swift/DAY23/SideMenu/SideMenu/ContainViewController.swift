//
//  ViewController.swift
//  SideMenu
//
//  Created by MADAO on 16/4/7.
//  Copyright © 2016年 MADAO. All rights reserved.
//

import UIKit

class ContainViewController: UIViewController {
    enum PanDirection{
        case left
        case right
        case none
    }
    
    //侧滑最小边距
    var sideWidth:CGFloat = 100
    var springWidth:CGFloat = 20
    //菜单是否显示中
    private var isMenuShow:Bool
    
    private let width = UIApplication.sharedApplication().windows[0].frame.size.width
    private let height = UIApplication.sharedApplication().windows[0].frame.size.height

    //菜单视图控制器
    var sideMenuViewController:MenuViewController?
    //视图控制器数组
    var vcArray:[UIViewController]?
    var direction:PanDirection = PanDirection.none
    
    //主视图控制器
    weak var mainController:UIViewController?
    
    init(vcArray:[UIViewController]){
        self.isMenuShow = false
        self.vcArray = vcArray
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image:UIImage(named:"backGroundImage"))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        loadViewController()
        loadSubViews()
        setPanGestureRecognizer()

    }
    
    //MARK: - SetViewControllersAndViews
    private func loadViewController() {
        sideMenuViewController = nil
        for viewController in self.childViewControllers{
            viewController.removeFromParentViewController()
        }
        sideMenuViewController = MenuViewController(style: UITableViewStyle.Plain, vcArray:vcArray!)
        sideMenuViewController?.viewControllerBeSelectedAtIndex = {
            (selectedIndex:NSInteger) in
            self.setNewMainViewController(self.vcArray![selectedIndex])
        }
        self.addChildViewController(sideMenuViewController!);
        mainController = sideMenuViewController?.viewControllerArray![0]
        self.addChildViewController(mainController!)
        
    }
    
    private func loadSubViews() {
        self.view.addSubview((sideMenuViewController?.view)!)
        sideMenuViewController?.view.frame = CGRectMake(-springWidth, 0, width - sideWidth + springWidth, height)
        
        self.view.addSubview((mainController?.view)!)
        mainController?.view.frame = self.view.frame;
    }
    
    //MARK: - Gesture
    private func setPanGestureRecognizer() {
        let panGR = UIPanGestureRecognizer.init(target: self, action: #selector(ContainViewController.handlePanGestureRecognizer(_:)))
        self.view.addGestureRecognizer(panGR)
    }
    
    @objc private func handlePanGestureRecognizer(panGesture:UIPanGestureRecognizer) {
        let transition = panGesture.translationInView(panGesture.view)
        if transition.x < 0 {
            direction = PanDirection.left
        }
        else if transition.x > 0 {
            direction = PanDirection.right
        }
        switch panGesture.state {
        case UIGestureRecognizerState.Changed:
            if !isMenuShow {
                //界面显示时防止左滑
                guard transition.x > 0 else
                {
                    break
                }
            }
            handlePanAction(withGesture:panGesture)
        case UIGestureRecognizerState.Ended,UIGestureRecognizerState.Cancelled:
            handlePanGestureCancelOrEnded(withTransition:transition)
        default:
            break
        }
        panGesture.setTranslation(CGPointZero, inView: self.view)
    }
    
    private func handlePanAction(withGesture gesture:UIPanGestureRecognizer) {
        let transition = gesture.translationInView(self.view)
        let newCenter = CGPointMake((mainController?.view.center.x)! + transition.x, mainController!.view.center.y)
        let newSideMenuCenter = CGPointMake((sideMenuViewController?.view.center.x)! + (springWidth * transition.x)/(width - sideWidth - springWidth),sideMenuViewController!.view.center.y)
        //边界范围处理
        if (newCenter.x - width/2 > width - sideWidth + springWidth) && isMenuShow {
            return
        }
        else if newCenter.x - width/2 > width - sideWidth + springWidth {
            return
        }
        else
        {
            mainController?.view.center = newCenter
            sideMenuViewController?.view.center = newSideMenuCenter
        }
    }
    
    private func handlePanGestureCancelOrEnded(withTransition transition:CGPoint) {
        let originX = (mainController?.view.frame.origin.x)! + transition.x
        if direction == PanDirection.left {
            //滑动超过1/4
            if originX > self.width/4.0 * 3{
                handleViewControllerPushAnimation(mainController!)
            }
            else
            {
                handleViewControllerPopAnimation(mainController!)
            }

        }
        else{
            if originX > self.width/4.0{
                handleViewControllerPushAnimation(mainController!)
            }
            else
            {
                handleViewControllerPopAnimation(mainController!)
 
            }
        }
    }
    
    private func handleViewControllerPushAnimation(viewController:UIViewController) {
        if mainController == viewController {
            //主界面动画
//            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
//                viewController.view.frame = CGRectMake(self.width - self.sideWidth, 0, self.width, self.height)
//                 self.sideMenuViewController?.view.frame = CGRectMake(0, 0, self.width, self.height)
//            }) { (success) in
//                viewController.view.userInteractionEnabled = false
//                self.isMenuShow = true
//            }
            //主界面动画
            UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                viewController.view.frame = CGRectMake(self.width - self.sideWidth, 0, self.width, self.height)
                self.sideMenuViewController?.view.frame = CGRectMake(0, 0, self.width, self.height)
                }, completion: { (success) in
                    viewController.view.userInteractionEnabled = false
                    self.isMenuShow = true
                    self.setNeedsStatusBarAppearanceUpdate()
            })
        }


    }
    
    private func  handleViewControllerPopAnimation(viewController:UIViewController) {
        if mainController == viewController {
            //主界面动画
//            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
//                viewController.view.frame = CGRectMake(0, 0, self.width, self.height)
//                self.sideMenuViewController?.view.frame = CGRectMake(-20, 0, self.width, self.height)
//            }) { (success) in
//                viewController.view.userInteractionEnabled = true
//                self.isMenuShow = false
//            }
            UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                viewController.view.frame = CGRectMake(0, 0, self.width, self.height)
                self.sideMenuViewController?.view.frame = CGRectMake(-20, 0, self.width, self.height)
                }, completion: { (success) in
                    viewController.view.userInteractionEnabled = true
                    self.isMenuShow = false
                    self.setNeedsStatusBarAppearanceUpdate()
            })
        }

    }
    
    private func fakePushAnimation(viewController:UIViewController) {
        let lastCenter = viewController.view.center
        let newCenter = CGPointMake(lastCenter.x + springWidth, lastCenter.y)
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            viewController.view.center = newCenter
            }) { (success) in
                self.handleViewControllerPopAnimation(viewController)
        }
    }
    
    //MARK: - SetViewController
    func setNewMainViewController(newVC:UIViewController) {
        guard newVC != mainController else{
            return
        }
        mainController?.removeFromParentViewController()
        mainController?.view.removeFromSuperview()
        let lastMainControllerFrame = mainController!.view.frame
        mainController = newVC
        mainController?.view.alpha = 0;
        UIView.animateWithDuration(0.3) {
            self.mainController?.view.alpha = 1
        }
        self.addChildViewController(newVC)
        self.view.addSubview((newVC.view)!)
        newVC.view.frame = lastMainControllerFrame
        fakePushAnimation(newVC)
    }
    
    //MARK: - StatusBar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        if isMenuShow {
            return .LightContent
        }
        else
        {
            return .Default
        }
    }
}

