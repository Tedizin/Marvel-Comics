//
//  ViewController.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 12/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    let mainService = ApiService()
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainService.marvelApiCall(using: {
            self.mainTableView.reloadData()
            })
    }
    
}

extension ViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainService.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        cell.textLabel?.text = mainService.characters[indexPath.row].name
        return cell
    }
    
    
}
