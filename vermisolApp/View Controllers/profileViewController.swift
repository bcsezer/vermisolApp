//
//  newsViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 30.08.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit
import Firebase

class profileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //TableView Section Headers
       var sections = ["Geçmiş Siparişlerim","Adres Bilgisini değiştirme","Kullanıcı Bilgilerim","Çıkış yap"]
       
       //tableView items in sections
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        checkedProfilePageIsActive()
    }
    
    func checkedProfilePageIsActive(){
        if Auth.auth().currentUser == nil{
            let vc = storyboard?.instantiateViewController(withIdentifier: "loginScreen")
            self.navigationController?.pushViewController(vc!, animated: true)
            tableView.isHidden = true
        }else{
            tableView.isHidden = false
        }
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

extension profileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! profileTableViewCell
        cell.profileCellTitle.text = sections[indexPath.row]
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sections[indexPath.row])
        
        if sections[indexPath.row] == "Çıkış yap"{
            do{
                try Auth.auth().signOut()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "loginScreen") as? loginViewController
                vc?.modalTransitionStyle = .crossDissolve
                vc?.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc!, animated: true)
            }catch{
                print("Error")
            }
           
        }
    }
}
