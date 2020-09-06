//
//  pdfsViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 6.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit
import WebKit

class pdfsViewController: UIViewController {

    var selectedPdf = ""
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showPDF()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        selectedPdf = ""
    }
    
    func showPDF(){

            let url = Bundle.main.url(forResource: selectedPdf, withExtension: "pdf")

            if let url = url {
             
                let webView = WKWebView(frame: view.frame)
                let urlRequest = URLRequest(url: url)
                webView.load(urlRequest)
          

                view.addSubview(webView)
             
            }
      }

}
