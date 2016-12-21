//
//  ContentViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/12/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var imageName: String?

    var index: Int!
    
    override func viewDidLoad() {
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let image = imageName {
            
            imageView.image = UIImage(imageLiteralResourceName: image)

        }
    }
    
}
