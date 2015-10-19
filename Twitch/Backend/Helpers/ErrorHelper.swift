//
//  ErrorHelper.swift
//  Twitch
//
//  Created by Rodrigo Placido on 18/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import Foundation

class ErrorHelper {
    func getErrorMessage (statusCode: Int) -> String {
        var message: String?
        if (statusCode >= 400 && statusCode < 500) {
            message = "Request Error"
        } else if (statusCode >= 500 && statusCode < 600) {
           message = "Service unavailable"
        } else {
            message = "No connection, check and try again"
        }
        return message!
    }
}