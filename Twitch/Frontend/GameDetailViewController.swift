//
//  GameDetailViewController.swift
//  Twitch
//
//  Created by Rodrigo Placido on 18/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import UIKit
import Haneke

class GameDetailViewController: UIViewController {
    var game: Twitch?
    @IBOutlet weak var lblChanel: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblViewers: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = game?.game?.name
        self.loadGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadGame() {
        self.lblName.text = game?.game?.name
        self.lblChanel.text = String(format: "Channels = %d", (game?.channels)!)
        self.lblViewers.text = String(format: "Viewers = %d", (game?.viewers)!)
        let imageURL = NSURL(string: (game?.game?.box?.medium)!)
        self.imgGame.hnk_setImageFromURL(imageURL, placeholder: UIImage(named: "placeholder"))
    }
}
