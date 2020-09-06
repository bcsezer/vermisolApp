//
//  hakkımızdaViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 6.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit
import WebKit

class hakkimizdaViewController: UIViewController {
   
    //Activity Indicator
   var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showPDF()
    }
    
    func showPDF(){

          let url = Bundle.main.url(forResource: "vermisol_hakkimizda_pdf", withExtension: "pdf")

          if let url = url {
           
              let webView = WKWebView(frame: view.frame)
              let urlRequest = URLRequest(url: url)
              webView.load(urlRequest)
        

              view.addSubview(webView)
           
          }
    }
    


}
