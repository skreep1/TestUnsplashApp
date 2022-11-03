//
//  DetailPhotoController.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 31.10.2022.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    @IBOutlet weak var test: UILabel!
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.text = photo?.likes.formatted()
    }
}

