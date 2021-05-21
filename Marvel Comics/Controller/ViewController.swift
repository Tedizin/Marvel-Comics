//
//  ViewController.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 12/05/21.
//

import UIKit
import Alamofire
import CryptoKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Variables
    
    var requestAPI = Service()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        requestAPI.requestCharacter {
            self.mainTableView.reloadData()
        }
        
    }
    
}

// MARK: - Table view data source

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestAPI.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! CharacterTableViewCell
        
        cell.textLabel?.text = requestAPI.characters[indexPath.row].name
        let url = URL(string: requestAPI.characters[indexPath.row].thumbnail.path + "/standard_fantastic.jpg")!
        cell.thumbnailImageView.loadImage(url: url)
        
        return cell
    }
}

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
