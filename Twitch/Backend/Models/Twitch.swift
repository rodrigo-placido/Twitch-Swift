//
//  Twitch.swift
//  Twitch
//
//  Created by Rodrigo Placido on 16/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import Foundation

class Twitch: Unboxable {
    var viewers: Int?
    var channels: Int?
    var game: Game?
    
    required init(unboxer: Unboxer) {
        self.viewers = unboxer.unbox("viewers")
        self.channels = unboxer.unbox("channels")
        self.game = unboxer.unbox("game")
    }
    
}