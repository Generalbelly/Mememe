//
//  MemedPictureViewController.swift
//  pick
//
//  Created by ShimmenNobuyoshi on 2015/04/02.
//  Copyright (c) 2015年 Shimmen Nobuyoshi. All rights reserved.
//

import UIKit

class MemedPictureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.imageView.image = image
    }

}