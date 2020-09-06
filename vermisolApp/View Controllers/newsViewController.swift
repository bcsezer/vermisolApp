//
//  newsViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 30.08.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class newsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavigationBarItem()
        // Do any additional setup after loading the view.
    }
    

   func addLogoToNavigationBarItem() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        //imageView.backgroundColor = .lightGray
        
        
        
        let contentView = UIView()
        self.navigationItem.titleView = contentView
        self.navigationItem.titleView?.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

}
