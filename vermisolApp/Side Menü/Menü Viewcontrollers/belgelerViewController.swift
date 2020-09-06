//
//  belgelerViewController.swift
//  vermisolApp
//
//  Created by Cem Sezeroglu on 1.09.2020.
//  Copyright © 2020 Cem Sezeroglu. All rights reserved.
//

import UIKit

class belgelerViewController: UIViewController {
    var selectedCell = ""
    
    @IBOutlet weak var tableView: UITableView!
    var sections = ["Kalite Belgeleri","Tescil Belgelesi","Lisans Belgelesi","Analiz Sonuçu","Araştırmalarımız","Sözleşmeler"]
    
    var itemsInSections = [["ISO Belgesi",
                            "Çiftçi Kayıt Belgemiz",
                            "İşletme Kayıt Belgesi",
                            "Vermisol Organik Sertifikası"],
                           ["Vermisol Tescil Belgesi"],
                           ["Vermisol Lisans Belgesi"],
                           ["Analiz Sonuçları"],
                           ["Marul uygulaması","Mevsimlik Çuha Çiçeği Üretiminde Solucan Gübresi Denemesi","Mevsimlik Hercai Menekşe Üretiminde Solucan Gübresi Denemesi","Yaprak Analizi Sonuçları","Beylerbeyi Sarayı Çim Denemesi","Antalya Domates Denemesi","T.C. Jokey Kulübü Denemesi","Dolmabahçe Sarayı Deneme"],["Bayilik Sözleşmesi","Bölge Temsilciliği Sözleşmesi"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: Prepare For Segue's
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? pdfsViewController {
            destination.selectedPdf = selectedCell
        }
        
    }
    
    
}
extension belgelerViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "belgelerCell", for: indexPath) as! belgelerTableViewCell
        
        cell.belgeTitle.text = itemsInSections[indexPath.section][indexPath.row]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        //For Header Background Color
        view.tintColor = .black
        
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        header.textLabel?.font = UIFont(name: "arial", size: 15)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCell =  itemsInSections[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "showPdf", sender: self)
    }
    
    
    
}
