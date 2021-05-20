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
    var apiRequest = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiRequest.apiRequest()
    }
}
