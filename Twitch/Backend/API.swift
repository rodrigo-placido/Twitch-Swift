//
//  API.swift
//  Twitch
//
//  Created by Rodrigo Placido on 18/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import Foundation

class API {
    let kURL_API_TOP50 = "https://api.twitch.tv/kraken/games/top"
    
    func getUrlTop50() -> String {
        return kURL_API_TOP50
    }
}
