//
//  TwitchTests.swift
//  TwitchTests
//
//  Created by Rodrigo Placido on 16/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import XCTest
import Foundation

@testable import Twitch

class TwitchTests: XCTestCase {
    var gamesArray = NSMutableArray()
    
    override func setUp() {
        super.setUp()
        let masterDataUrl: NSURL = NSBundle.mainBundle().URLForResource("game", withExtension: "json")!
        
        let jsonData: NSData = NSData(contentsOfURL: masterDataUrl)!
        do {
            let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options:  NSJSONReadingOptions.MutableContainers) as! NSDictionary
            let modelConverter: TwitchModelConverter = TwitchModelConverter()
            gamesArray = modelConverter.converterModel(jsonResult)
        } catch {
            print("json error: \(error)")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGamesCount() {
        XCTAssertEqual(gamesArray.count, 3)
    }
    
    func testGames() {
        let twitch: Twitch = gamesArray[0] as! Twitch
        XCTAssertEqual(twitch.game?.name, "League of Legends")
        XCTAssertEqual(twitch.viewers, 99586)
        XCTAssertEqual(twitch.channels, 1698)
        XCTAssertEqual(twitch.game?.box?.medium, "http://static-cdn.jtvnw.net/ttv-boxart/League%20of%20Legends-136x190.jpg")
    }
    
    func testErrorCode() {
        let errorHelper = ErrorHelper()
        
        var message: NSString = errorHelper.getErrorMessage(-1009)
        XCTAssertEqual(message, "No connection, check and try again")
        
        message = errorHelper.getErrorMessage(403)
        XCTAssertEqual(message, "Request Error")
        
        message = errorHelper.getErrorMessage(503)
        XCTAssertEqual(message, "Service unavailable")
    }
}
