//
//  Game.swift
//  Twitch
//
//  Created by Rodrigo Placido on 16/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import Foundation

class Game: Unboxable {
    var name: String?
    var id: Int?
    var giantBombId: Int?
    var box: Box?
    var logo: Logo?
    
    required init(unboxer: Unboxer) {
        self.name = unboxer.unbox("name")
        self.id = unboxer.unbox("_id")
        self.giantBombId = unboxer.unbox("giantbomb_id")
        self.box = unboxer.unbox("box")
        self.logo = unboxer.unbox("logo")
    }
}