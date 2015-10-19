//
//  Top50TableViewCell.swift
//  Twitch
//
//  Created by Rodrigo Placido on 18/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import UIKit
import Haneke

class Top50TableViewCell: UITableViewCell {
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblTitleGame: UILabel!
    
    func setImageURL(url:String) {
        let imageURL = NSURL(string: url)
        self.imgGame.hnk_setImageFromURL(imageURL, placeholder: UIImage(named: "placeholder"))
    }
}
