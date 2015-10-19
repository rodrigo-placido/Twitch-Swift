//
//  Top50TableViewController.swift
//  Twitch
//
//  Created by Rodrigo Placido on 18/10/15.
//  Copyright © 2015 Rodrigo. All rights reserved.
//

import UIKit
import SVProgressHUD

class Top50TableViewController: UITableViewController {
    var gamesArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top 50"
        self.loadGames()
        
        /* PULL TO REFRESH */
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "reloadData", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl!)
        
        /* Remove extra separator */
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* load methods */
    
    func loadGames() {
        SVProgressHUD.showWithStatus("Loading games")
        let controller = TwitchController()
        self.gamesArray = NSMutableArray()
        controller.getTop50Games { (gamesArray, statusCode) -> () in
            if statusCode == 200 {
                self.gamesArray = gamesArray
                self.tableView.reloadData()
                SVProgressHUD.showSuccessWithStatus("Games Loaded")
            } else {
                let errorHelper = ErrorHelper()
                SVProgressHUD.showErrorWithStatus(errorHelper.getErrorMessage(statusCode!))
            }
        }
    }
    
    func reloadData (){
        self.refreshControl?.endRefreshing()
        self.gamesArray?.removeAllObjects()
        self.tableView?.reloadData()
        self.loadGames()
    }

    /* TableView methods */
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.gamesArray?.count)!
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Top50TableViewCell", forIndexPath: indexPath) as! Top50TableViewCell
        if let games = self.gamesArray?[indexPath.row] as? Twitch {
            cell.lblTitleGame.text = games.game?.name
            cell.setImageURL((games.game?.box?.medium)!)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("GameDetailViewController") as! GameDetailViewController
        vc.game = self.gamesArray?[indexPath.row] as? Twitch
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
