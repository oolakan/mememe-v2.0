//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Swifta on 2/16/18.
//  Copyright © 2018 Swifta. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private let reuseIdentifier = "memeTableCell"
 
    @IBOutlet weak var memeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeTable.delegate = self
        memeTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        memeTable.reloadData()
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UIApplication.shared.delegate as! AppDelegate).memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? MemeTableViewCell else {
            return UITableViewCell()
        }
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row]
        cell.memeLabel.text = "\(meme.topText)...\(meme.bottomText)"
        cell.memeImage.image = meme.memedImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var controller: MemeDetailViewController!
        controller = self.storyboard?.instantiateViewController(withIdentifier: "memeDetailPage") as? MemeDetailViewController
        controller.meme = (UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func createNewMemeObject(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createNewMeme", sender: nil)
    }
}
