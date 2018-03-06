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
    @IBOutlet weak var memeLabel: UILabel!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeLabel.text = "\(meme.topText)...\(meme.bottomText)"
        memeImage.image = meme.memedImage
    }
}
