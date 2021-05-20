//
//  ViewController.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 12/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    // MARK:- Variáveis
    @IBOutlet weak var tableview: UITableView!
    
    // MARK:- Constantes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
    }
    
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return mensagens.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableview.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
            cell.textLabel?.text = mensagens[indexPath.row].body
            return cell
        }
    }
    
    func fetchData() {
        
    }
}
