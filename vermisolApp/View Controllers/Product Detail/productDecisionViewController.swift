//
//  productDecisionViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 5.10.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class productDecisionViewController: UIViewController {
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var sepeteGitButton: UIButton!
    @IBOutlet weak var alisveriseDevamEtButton: UIButton!
    @IBOutlet weak var ürününAdıLabel: UILabel!
    
    
      
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
     
        
    }
    
    @IBAction func sepeteGitAction(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
        navigationController?.popViewController(animated: true)

    }
    
    
    @IBAction func alisveriseDevamEtAction(_ sender: Any) {
        
    performSegue(withIdentifier: "toHomeScreen", sender: self)
        
        
    
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? productDetailViewController{
//            destination.ifselectedOrder = true
//        }
//    }

}
