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
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! mainTableViewCell
        cell.textLabel?.text = mainService.characters[indexPath.row].name
        let url = URL(string: mainService.characters[indexPath.row].thumbnail.path + "/standard_fantastic.jpg")!
        cell.mainImage.loadImage(url: url)
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
