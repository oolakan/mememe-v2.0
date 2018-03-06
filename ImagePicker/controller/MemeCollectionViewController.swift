//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Swifta on 2/16/18.
//  Copyright © 2018 Swifta. All rights reserved.
//

import UIKit

private let reuseIdentifier = "memeCollectionCell"

class MemeCollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayoutMeme: UICollectionViewFlowLayout!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCellSize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (UIApplication.shared.delegate as! AppDelegate).memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as? MemeCollectionViewCell else {
            return UICollectionViewCell()
        }
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row]
        cell.memeImage.image = meme.memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var controller: MemeDetailViewController!
        controller = self.storyboard?.instantiateViewController(withIdentifier: "memeDetailPage") as? MemeDetailViewController
        controller.meme = (UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func createNewMeme(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createNewMeme", sender: nil)
    }
    
    fileprivate func configureCellSize() {
        // Do any additional setup after loading the view.
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayoutMeme.minimumInteritemSpacing = space
        flowLayoutMeme.minimumLineSpacing = space
        flowLayoutMeme.itemSize = CGSize(width: dimension, height: dimension)
    }

}
