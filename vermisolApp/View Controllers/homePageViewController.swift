//
//  homePageViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 30.08.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class homePageViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    //Menu Transition
    let transition = SlideInTransition()
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavigationBarItem()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    override func viewDidLayoutSubviews() {
        
    }
    // MARK: Nav Bar'a logo eklenmesi
   
    
    
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
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        guard  let menuViewController = storyboard?.instantiateViewController(identifier: "slideMenu") as? MenuTableViewController else {return}
              menuViewController.didTapMenuType = { menuType in
                  self.transitionToNew(menuType)
              }
              menuViewController.modalPresentationStyle = .overCurrentContext
              menuViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
              present(menuViewController, animated: true)
              
              
              let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
              swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
              let tap = UITapGestureRecognizer(target: self, action:    #selector(self.handleTap(_:)))
              transition.blackView.addGestureRecognizer(tap)
              transition.blackView.addGestureRecognizer(swipeLeft)
              menuViewController.view.addGestureRecognizer(swipeLeft)
    }
    
     func transitionToNew(_ menuType: MenuType){
        switch menuType {
            
        case.belgeler:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "belgeler") as? belgelerViewController
            vc?.modalTransitionStyle = .crossDissolve
            vc?.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc!, animated: true)
        case.etkinlikler:
            print("Belgeler")
        case.satisNoktalari:
            print("Belgeler")
        case.hakkımızda:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "hakkımızda") as? hakkimizdaViewController
            vc?.modalTransitionStyle = .crossDissolve
            vc?.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc!, animated: true)
        case.iletisim:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "iletisim") as? iletisimViewController
            vc?.modalTransitionStyle = .crossDissolve
            vc?.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
          dismiss(animated: true, completion: nil)
      }
}
extension homePageViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! homePageCollectionViewCell
        
        
        cell.imageView.image = UIImage(named: "1")
        cell.titleOfTheProduct.text = "deneme"
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize :CGRect = UIScreen.main.bounds
        print(screenSize)
        var widthCrll = 0
        var heightCell = 0
        
        if screenSize.width == 414.0 {
            
            widthCrll = 300 //188
            heightCell = 172
            
        }else {
            widthCrll = 160 //120
            heightCell = 172
        }
        
        return  CGSize(width: widthCrll, height: heightCell)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let screenSize :CGRect = UIScreen.main.bounds
        print(screenSize)
        var top = 0
        var left = 0
        var bottom = 0
        var right = 0
        
        if screenSize.width == 414.0 {
            top = 10
            left = 30
            right = 30
            bottom = 10
            
            
        }else {
            top = 10
            left = 10
            right = 10
            bottom = 10
        }
        return UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "productDetailVC", sender: self)
    }
}
extension homePageViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
}
