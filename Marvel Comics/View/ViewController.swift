//
//  ViewController.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 12/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var requestAPI = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAPI.requestURL()
        
    }
    
}

extension Characters {
    
    var titleLabelText: String {
        name
      }
    
    var subtitleLabelText: String {
        "\(String(id))"
      }
    
    var item1: (label: String, value: String) {
        ("Description: ", description)
      }
    
}

