//
//  Logo.swift
//  Twitch
//
//  Created by Rodrigo Placido on 16/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import Foundation

class Logo: Unboxable {
    var large: String?
    var medium: String?
    var small: String?
    
    required init(unboxer: Unboxer) {
        self.large = unboxer.unbox("large")
        self.medium = unboxer.unbox("medium")
        self.small = unboxer.unbox("small")
    }
}