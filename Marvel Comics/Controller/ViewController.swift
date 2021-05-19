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
        searchCharacters(texto: "Hulk")
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

extension ViewController {
    
    func searchCharacters(texto: String){
        Service.shared.requestCharacter(text: texto) { (data) in
            print(data!)
        }
    }
}

//extension ViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
