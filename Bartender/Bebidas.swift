//
//  Bebidas.swift
//  Bartender
//
//  Created by Guillermo Alonso on 05/10/16.
//  Copyright © 2016 cep.UNAMMemosCorp. All rights reserved.
//

import UIKit

class Bebidas: UITableViewController {
    
    var lasBebidas:NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let elPathBebidas = NSBundle.mainBundle().pathForResource("Drinks", ofType: "plist")
        self.lasBebidas = NSArray(contentsOfFile: elPathBebidas!)
        self.navigationItem.title = "BEBIDAS PREPARADAS"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title="BEBIDAS"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.lasBebidas!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        // Configure the cell...
        let dictInfo = self.lasBebidas![indexPath.row] as! NSDictionary
        cell.textLabel?.text = (dictInfo["name"] as! String).lowercaseString
        let laImg = (dictInfo["image"] as! String).lowercaseString
        cell.imageView?.image = UIImage(named: laImg)
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let location = segue.destinationViewController as! DetalleBebida
        // Pass the selected object to the new view controller.
        let elIndexPath = self.tableView.indexPathForSelectedRow
        let dictInfo = self.lasBebidas![elIndexPath!.row] as! NSDictionary
        location.info = dictInfo
    }

}
