//
//  ViewController.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 12/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchLabel: UITextField!
    
    // MARK: - Variables
    
    var requestAPI = Service()
    var arrayCharacters: [Characters] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCharacters(texto: "Hulk")
    }
    
}

// MARK: - Extensions

extension ViewController {
    
    func searchCharacters(texto: String){
        Service.shared.requestCharacter(text: texto) { (data) in
            print(data!)
        }
    }
}

// MARK: - Table view data source

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        cell.textLabel?.text = arrayCharacters[indexPath.row].name
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let alertController = UIAlertController(title: "Description", message: arrayCharacters[indexPath.row].description , preferredStyle: .alert)
//
//        let actionConfirm = UIAlertAction(title: "OK", style: .default, handler: nil)
//
//        alertController.addAction(actionConfirm)
//
//        present(alertController, animated: true, completion: nil)
//
//    }
    
}
