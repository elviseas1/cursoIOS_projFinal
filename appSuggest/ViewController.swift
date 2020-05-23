//
//  ViewController.swift
//  appSuggest
//
//  Created by Elvis Silveira on 18/05/20.
//  Copyright © 2020 Elvis Silveira. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
   var elementos = [AppInfo]()
    
    var referenciaDatabase : DatabaseReference!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementos.count
    }
    
    func formatPriceInCents(price : Int) -> String {
        if price == 0{
            return "FREE"
        }
        
        return "$\(Int(price/100)).\(price%100)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "appCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AppTableViewCell
        
        let appInfo = elementos[indexPath.row]
        cell.name.text = appInfo.name
        cell.preco.text = formatPriceInCents(price: appInfo.price)
        cell.imageBG.image = UIImage(named: "star")
        cell.imageBG.downloadedFrom(link: appInfo.imageURL, contentMode: UIView.ContentMode.scaleAspectFill)
        
        
        return cell
    }
    
    func carregarDados(){
        let pastaApps = referenciaDatabase.child("apps")
        
        pastaApps.queryOrderedByKey()
        pastaApps.queryStarting(atValue: self.elementos.count)
        pastaApps.queryEnding(atValue: self.elementos.count + 4)
        
        pastaApps.observeSingleEvent(of: DataEventType.value) { (snapShot) in
            for item in snapShot.children{
                let appInfo = AppInfo(snapShot: item as! DataSnapshot)
                self.elementos.append(appInfo)
            }
            
            self.tableView.reloadData()
        
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        referenciaDatabase = Database.database().reference()
        
        carregarDados()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let ultimoItem = elementos.count - 1
        if indexPath.row == ultimoItem {
            carregarDados()
        }
    }


}

