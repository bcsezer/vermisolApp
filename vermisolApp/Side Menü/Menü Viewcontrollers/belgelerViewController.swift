//
//  belgelerViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 1.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class belgelerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cellTitles = ["Kalite Belgeleri","tescil Belgeleri","Lisans Belgeleri","Analiz Sonuçları","Araştırmalarımız","Sözleşmeler"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    

  

}
extension belgelerViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "belgelerCell", for: indexPath) as! belgelerTableViewCell
        cell.belgeTitle.text = cellTitles[indexPath.row]
        
        return cell
    }
    
    
}
