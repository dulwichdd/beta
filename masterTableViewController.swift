//
//  masterTableViewController.swift
//  beta
//
//  Created by CHRIS WARNER on 30/11/2014.
//  Copyright (c) 2014 CHRIS WARNER. All rights reserved.
//

import UIKit
import CoreData


class masterTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource {
    
    let noPhotoPNG = "no_photo.png"
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()


    @IBAction func homepressed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Data")
        
        
        if (self.title == "Spring Bed 1"){
            fetchRequest.predicate = NSPredicate (format: "(ref = 'Spring Bed 1')", fetchRequest)
            
        }else{
            if (self.title == "Summer Bed 1"){
                fetchRequest.predicate = NSPredicate (format: "(ref = 'Summer Bed 1')", fetchRequest)
            }else{
                if (self.title == "Autumn Bed 1"){
                    fetchRequest.predicate = NSPredicate (format: "(ref = 'Autumn Bed 1')", fetchRequest)
            
                }else{
                    if (self.title == "Winter Bed 1"){
                        fetchRequest.predicate = NSPredicate (format: "(ref = 'Winter Bed 1')", fetchRequest)
                
                    }else{if (self.title == "Spring Bed 2"){
                        fetchRequest.predicate = NSPredicate (format: "(ref = 'Spring Bed 2')", fetchRequest)
                        
                    }else{
                        if (self.title == "Summer Bed 2"){
                            fetchRequest.predicate = NSPredicate (format: "(ref = 'Summer Bed 2')", fetchRequest)
                        }else{
                            if (self.title == "Autumn Bed 2"){
                                fetchRequest.predicate = NSPredicate (format: "(ref = 'Autumn Bed 2')", fetchRequest)
                                
                            }else{
                                if (self.title == "Winter Bed 2"){
                                    fetchRequest.predicate = NSPredicate (format: "(ref = 'Winter Bed 2')", fetchRequest)
                                    
                                    }else{if (self.title == "Spring Bed 3"){
                                        fetchRequest.predicate = NSPredicate (format: "(ref = 'Spring Bed 3')", fetchRequest)
                                        
                                    }else{
                                        if (self.title == "Summer Bed 3"){
                                            fetchRequest.predicate = NSPredicate (format: "(ref = 'Summer Bed 3')", fetchRequest)
                                        }else{
                                            if (self.title == "Autumn Bed 3"){
                                                fetchRequest.predicate = NSPredicate (format: "(ref = 'Autumn Bed 3')", fetchRequest)
                                                
                                            }else{
                                                if (self.title == "Winter Bed 3"){
                                                    fetchRequest.predicate = NSPredicate (format: "(ref = 'Winter Bed 3')", fetchRequest)
                                
                                
                                                }else{if (self.title == "Spring Bed 4"){
                                                    fetchRequest.predicate = NSPredicate (format: "(ref = 'Spring Bed 4')", fetchRequest)
                                                    
                                                }else{
                                                    if (self.title == "Summer Bed 4"){
                                                        fetchRequest.predicate = NSPredicate (format: "(ref = 'Summer Bed 4')", fetchRequest)
                                                    }else{
                                                        if (self.title == "Autumn Bed 4"){
                                                            fetchRequest.predicate = NSPredicate (format: "(ref = 'Autumn Bed 4')", fetchRequest)
                                                            
                                                        }else{
                                                            if (self.title == "Winter Bed 4"){
                                                                fetchRequest.predicate = NSPredicate (format: "(ref = 'Winter Bed 4')", fetchRequest)

                                                            }else{if (self.title == "Spring Bed 5"){
                                                                fetchRequest.predicate = NSPredicate (format: "(ref = 'Spring Bed 5')", fetchRequest)
                                                                
                                                            }else{
                                                                if (self.title == "Summer Bed 5"){
                                                                    fetchRequest.predicate = NSPredicate (format: "(ref = 'Summer Bed 5')", fetchRequest)
                                                                }else{
                                                                    if (self.title == "Autumn Bed 5"){
                                                                        fetchRequest.predicate = NSPredicate (format: "(ref = 'Autumn Bed 5')", fetchRequest)
                                                                        
                                                                    }else{
                                                                        if (self.title == "Winter Bed 5"){
                                                                            fetchRequest.predicate = NSPredicate (format: "(ref = 'Winter Bed 5')", fetchRequest)
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
                        }
                    }
                }
            }
        }
        
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
        
    }
    

    
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections = fetchedResultController.sections?.count
        return numberOfSections!
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = fetchedResultController.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as myCell
        let data = fetchedResultController.objectAtIndexPath(indexPath) as Data
        //cell.lblref.text = data.ref
        cell.lblcrop.text = data.crop
        cell.lblvariety.text = data.variety
      
        cell.lblspacing.text = data.spacing
        cell.lbldepth.text = data.depth
        cell.lbldate.text = data.date
        cell.lblnoofrows.text = data.rows
        cell.lblsoiltype.text = data.soiltype
        //cell.lblurl.text = data.photoFullURL
        
        let thumbnailPhoto: UIImageView = cell.thumb as UIImageView
        
        
        let noPhotoStr = NSURL(fileURLWithPath: noPhotoPNG)?.absoluteString
        if(data.photoFullURL != noPhotoStr){
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentsDir: NSString = paths.objectAtIndex(0) as NSString
            
            let path: NSString = documentsDir.stringByAppendingString(data.photoThumbURL)
            thumbnailPhoto.image = UIImage(contentsOfFile: path)
        }else{
            thumbnailPhoto.image = UIImage(named: noPhotoPNG)
        }
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let managedObject:NSManagedObject = fetchedResultController.objectAtIndexPath(indexPath) as NSManagedObject
        managedObjectContext?.deleteObject(managedObject)
        managedObjectContext?.save(nil)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "additional") {
            let IVC2: additionViewController = segue.destinationViewController as additionViewController
            IVC2.title = self.title
        }else{
            if segue.identifier == "edit" {
                let cell = sender as UITableViewCell
                let indexPath = tableView.indexPathForCell(cell)
                let taskController:additionViewController = segue.destinationViewController as additionViewController
                let task:Data = fetchedResultController.objectAtIndexPath(indexPath!) as Data
                taskController.data = task
            }

        }
        
        
    }
        
        
    

        func controllerDidChangeContent(controller: NSFetchedResultsController!) {
            tableView.reloadData()
            
            
        }
        
        
        
        
        
        
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}





