//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Swifta on 3/6/18.
//  Copyright © 2018 Swifta. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var memeImage: UIImageView!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImage.image = meme.memedImage
    }
}
