//
//  productDetailViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 1.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit
import ImageSlideshow

class productDetailViewController: UIViewController, ImageSlideshowDelegate {

    var ifselectedOrder = false
    
    
     let localSource = [BundleImageSource(imageString: "1"), BundleImageSource(imageString: "2"), BundleImageSource(imageString: "3")]
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    @IBOutlet weak var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFit
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        slideshow.pageIndicator = pageControl
        slideshow.setImageInputs(localSource)
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        
       let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
       slideshow.addGestureRecognizer(recognizer)
        
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureOrderButtonClicked()
        configureBuyButton()
    }
    func configureBuyButton(){
        buyButton.layer.cornerRadius = 5
        buyButton.layer.masksToBounds = true
        
    }
  
        func configureOrderButtonClicked(){
            
            if ifselectedOrder == true{
                tabBarController?.selectedIndex = 2
            }else{
                ifselectedOrder = false
            }
        }
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
             print("current page:", page)
         }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: UIActivityIndicatorView.Style.medium, color: .white)
    }
    
}
