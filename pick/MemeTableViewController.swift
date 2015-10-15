//
//  MemeTableViewController.swift
//  pick
//
//  Created by ShimmenNobuyoshi on 2015/03/23.
//  Copyright (c) 2015年 Shimmen Nobuyoshi. All rights reserved.
//

import UIKit
import Foundation

class MemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var memes: [Meme]!

    @IBOutlet weak var tableView: UITableView!

    @IBAction func addTapped(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addMemeFromTableView", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell") as! MemeTableViewCell
        let meme = memes[indexPath.row]
        cell.memeImage.image = meme.memedImage
        cell.firstLabel.text = meme.text
        cell.secondLabel.text = meme.text2
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dvc = self.storyboard?.instantiateViewControllerWithIdentifier("MemedPictureViewController")as! MemedPictureViewController
        let meme = memes[indexPath.row]
        dvc.image = meme.memedImage
        self.navigationController?.pushViewController(dvc, animated: true)
    }


}