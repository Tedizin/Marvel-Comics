//
//  DetailsViewController.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 20/05/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var characters: Characters!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = characters.name
        descriptionLabel.text = characters.description

    }

}
