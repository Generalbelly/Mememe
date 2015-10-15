//
//  MemeCollectionViewController.swift
//  pick
//
//  Created by ShimmenNobuyoshi on 2015/03/23.
//  Copyright (c) 2015年 Shimmen Nobuyoshi. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var memes: [Meme]!
    var imageForDetail: UIImage?

    @IBAction func addTapped(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addMemeFromCollectionView", sender: self)
    }

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as? AppDelegate
        memes = appDelegate!.memes
        self.collectionView.reloadData()
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as? MemeCollectionViewCell
        let meme = memes[indexPath.item]
        cell!.imageView?.image = meme.memedImage
        return cell!
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let meme = memes[indexPath.item]
        self.imageForDetail = meme.memedImage
        performSegueWithIdentifier("detailFromCollection", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailFromCollection" {
            let dvc = segue.destinationViewController as! MemedPictureViewController
            dvc.image = self.imageForDetail
        }
    }

}
