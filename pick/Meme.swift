//
//  Meme.swift
//  pick
//
//  Created by ShimmenNobuyoshi on 2015/03/22.
//  Copyright (c) 2015年 Shimmen Nobuyoshi. All rights reserved.
//

import Foundation
import UIKit

class Meme {

    let text: String
    let text2: String
    let image: UIImage
    let memedImage: UIImage

    init( text: String, text2: String, image: UIImage, memedImage: UIImage ) {
        self.text = text
        self.text2 = text2
        self.image = image
        self.memedImage = memedImage
    }

}