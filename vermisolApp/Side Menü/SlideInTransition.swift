//
//  SlideInTransition.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 31.08.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject,UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let blackView = UIView()
    
   
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
   
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
       
       
      guard   let toViewController = transitionContext.viewController(forKey: .to),
        let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        
        let containerView = transitionContext.containerView
        let finalWitdh = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            //Add black view
            blackView.backgroundColor = .black
            blackView.alpha = 0.0
            containerView.addSubview(blackView)
            blackView.frame = containerView.bounds
            
          //  blackView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(menukapa)))
            
            // add menuview controller to container
            containerView.addSubview(toViewController.view)
            
            //initial frame of the screen
            toViewController.view.frame = CGRect(x: -finalWitdh, y: 0, width: finalWitdh, height: finalHeight)
            
        }
        //Animate on the screen
        let transfrom = {
            self.blackView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWitdh, y: 0)
            
            
        }
        //Animate back off screen
        let identity = {
            self.blackView.alpha = 0.0
            fromViewController.view.transform = .identity
            
        }
        //Animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transfrom() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
     
        
    }
    

}

