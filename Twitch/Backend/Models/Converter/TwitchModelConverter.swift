//
//  TwitchModelConverter.swift
//  Twitch
//
//  Created by Rodrigo Placido on 18/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import Foundation

class TwitchModelConverter {
    func converterModel(json: NSDictionary) -> NSMutableArray {
        let twitchArray:NSMutableArray? = NSMutableArray()
        let jsonTop: NSArray
        jsonTop = json["top"] as! NSArray
        for jsonDict in jsonTop {
            var twitch: Twitch?
            twitch = Unbox(jsonDict as! UnboxableDictionary)
            twitchArray!.addObject(twitch!)
        }
        return twitchArray!
    }
}