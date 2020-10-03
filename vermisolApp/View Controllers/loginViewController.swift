//
//  loginViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 19.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cornerRadious(textField: emailText)
        cornerRadious(textField: passwordText)
        cornerRadiousbuttons(button: loginButton)
        cornerRadiousbuttons(button: signUpButton)
        
        
        let i = navigationController?.viewControllers.firstIndex(of: self)
        let previousViewController = navigationController?.viewControllers[i!-1]
        
        print(previousViewController!)
    }
    
    
    func cornerRadious(textField:UITextField){
        textField.setLeftPaddingPoints(8)
        textField.borderStyle = .none
        textField.layer.cornerRadius = 5
        textField.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.layer.borderWidth = 1
        
    }
    func cornerRadiousbuttons(button:UIButton){
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
         button.layer.borderWidth = 1
    }
    @IBAction func üyeOlButtonClicked(_ sender: Any) {
        
        if emailText.text != "" && emailText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (userData, error) in
            
            if error != nil{
                self.makeAllert(title: "Uyarı", message: error!.localizedDescription)
                
            }else{
                self.performSegue(withIdentifier: "toHomeScreen", sender: self)
            }
          
        }
        }else{
         makeAllert(title: "Uyarı", message: "Eksik bilgi girdiniz")
            
        }
    }
    @IBAction func girisYapButtonClicked(_ sender: Any) {
        if emailText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (userData, error) in
                
            if error != nil{
                self.makeAllert(title: "Uyarı", message: error!.localizedDescription)
                
            }else if self.navigationController?.viewControllers.previous is profileViewController{
                //MARK:To return profile page
                self.navigationController?.popViewController(animated: true)
            }
           
          
        }
        }else{
         makeAllert(title: "Uyarı", message: "Eksik bilgi girdiniz")
            
        }
    }
    func makeAllert(title:String,message:String){
        let allert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                   let okButton = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                   allert.addAction(okButton)
                   self.present(allert, animated: true, completion: nil)
    }
}

extension UITextField {
func setLeftPaddingPoints(_ amount:CGFloat){
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = paddingView
    self.leftViewMode = .always
}
func setRightPaddingPoints(_ amount:CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.rightView = paddingView
    self.rightViewMode = .always
}
}
extension Array where Iterator.Element == UIViewController {

    var previous: UIViewController? {
        if self.count > 1 {
            return self[self.count - 2]
        }
        return nil
    }

}
