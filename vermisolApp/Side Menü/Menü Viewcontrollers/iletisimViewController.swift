//
//  iletisimViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 6.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit
import MessageUI

class iletisimViewController: UIViewController, MFMailComposeViewControllerDelegate {
    fileprivate let application = UIApplication.shared
    @IBOutlet weak var view1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cornerRadiousConfig(view: view1)
       
    }
    

    func cornerRadiousConfig(view:UIView){
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    }
    //Aramak için
    @IBAction func MerkezPhoneButtonClicked(_ sender: UIButton) {
        
        if let phoneUrl = URL(string: "tel://02163012323"){
            if application.canOpenURL(phoneUrl){
                application.open(phoneUrl, options: [:], completionHandler: nil)
                
            }else{
                print("Telefon Error")
                
            }
        }
    }
    @IBAction func istanbulBölgeTel(_ sender: Any) {
        if let phoneUrl = URL(string: "tel://02163212241"){
                 if application.canOpenURL(phoneUrl){
                     application.open(phoneUrl, options: [:], completionHandler: nil)
                     
                 }else{
                     print("Telefon Error")
                     
                 }
             }
    }
    
    //Mail atmak için
    @IBAction func mailButtonClicked(_ sender: UIButton) {
        print("Maile tıklıyorum")
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["info@vermisol.com"])
            mail.setMessageBody("<p>Merhaba!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            print("Mail error")
            
        }
    }
}
