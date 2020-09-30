//
//  redirectToLoginViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 30.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class redirectToLoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBuyButton()
    }
    
    @IBAction func toLoginVc(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginScreen") as! loginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    func configureBuyButton(){
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        
    }
}
