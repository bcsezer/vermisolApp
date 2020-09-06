//
//  MenuTableViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 31.08.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

enum  MenuType: Int ,CaseIterable{
       
       case belgeler
       case etkinlikler
       case satisNoktalari
       case hakkımızda
       case iletisim
       
       
   }

class MenuTableViewController: UITableViewController {
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var view5: UIView!
    @IBOutlet var menuGreenViews: [UIView]!
    var didTapMenuType: ((MenuType) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        greenViewConfig(view: view1)
        greenViewConfig(view: view2)
        greenViewConfig(view: view3)
        greenViewConfig(view: view4)
        greenViewConfig(view: view5)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         dismiss(animated: true)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
        dismiss(animated: true){ [weak self] in
            self?.didTapMenuType?(menuType)
            
            
        }
        
    }

    func greenViewConfig(view:UIView){
        
           view.layer.cornerRadius = 7;
           view.layer.masksToBounds = true;
        view.dropShadow()
        
    }
 
}
extension UIView {


func dropShadow() {

    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 5, height: 7)
    layer.masksToBounds = false

    layer.shadowOpacity = 0.2
    layer.shadowRadius = 3
    //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.rasterizationScale = UIScreen.main.scale
    layer.shouldRasterize = true
}}
