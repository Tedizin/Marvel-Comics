//
//  ViewController.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 12/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainService = ApiService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainService.marvelApiCall()
    }
    
}
