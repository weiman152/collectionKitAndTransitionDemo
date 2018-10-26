//
//  ScaleTransitionVC.swift
//  CollectionKitDemo
//
//  Created by iOS on 2018/10/26.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ScaleTransitionVC: NSObject {
    
    // 设置转场代理
    static var scaleTransition = ScaleTransitionVC()
    
    static func pushWithScale(fromVC: UIViewController, toVC: UIViewController) {
        
        fromVC.navigationController?.delegate = ScaleTransitionVC.scaleTransition
        fromVC.navigationController?.pushViewController(toVC, animated: true)
        fromVC.navigationController?.delegate = nil
    }
}

extension ScaleTransitionVC: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toVC = transitionContext.viewController(forKey: .to)
        let fromVC = transitionContext.viewController(forKey: .from)
        let containerView = transitionContext.containerView
        
        guard let fromView = fromVC?.view,
              let toView = toVC?.view else {
            return
        }
        
        containerView.addSubview(toView)
        transitionContext.containerView.bringSubviewToFront(fromView)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            
            fromView.alpha = 0
            fromView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            toView.alpha = 1.0
            
        }) { (finish) in
            
            fromView.transform = CGAffineTransform(scaleX: 1, y: 1)
            transitionContext.completeTransition(true)
            fromView.alpha = 1.0
        }
    }
}
extension ScaleTransitionVC: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ScaleTransitionVC()
    }
}
