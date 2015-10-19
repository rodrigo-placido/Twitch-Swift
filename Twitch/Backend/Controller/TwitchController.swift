//
//  TwitchController.swift
//  Twitch
//
//  Created by Rodrigo Placido on 16/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import Foundation
import Alamofire

class TwitchController {
    let api = API()
    
    func getTop50Games(completionHandler: (NSMutableArray?, Int?) -> ()) -> () {
        let url = api.getUrlTop50()
        Alamofire.request(.GET, url, parameters: ["limit": "50"])
            .responseJSON { response in
                var statusCode: Int
                if let httpError = response.result.error {
                    statusCode = httpError.code
                } else { //no errors
                    statusCode = (response.response?.statusCode)!
                }
                var twitchArray: NSMutableArray? = NSMutableArray()
                if let JSON = response.result.value {
                    let modelConverter: TwitchModelConverter = TwitchModelConverter()
                    twitchArray = modelConverter.converterModel(JSON as! NSDictionary)
                }
                completionHandler(twitchArray, statusCode)
        }
    }
}
