//
//  seasonViewController.swift
//  beta
//
//  Created by CHRIS WARNER on 30/11/2014.
//  Copyright (c) 2014 CHRIS WARNER. All rights reserved.
//

import UIKit

class seasonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "spring") {
            let IVC: masterTableViewController = segue.destinationViewController as masterTableViewController
            IVC.title = "Spring \(self.title!)"
            
        }else{
            if (segue.identifier == "summer") {
                let IVC: masterTableViewController = segue.destinationViewController as masterTableViewController
                IVC.title = "Summer \(self.title!)"
                
            }else{
                if (segue.identifier == "autumn") {
                    let IVC: masterTableViewController = segue.destinationViewController as masterTableViewController
                    IVC.title = "Autumn \(self.title!)"
                }else{
                    if (segue.identifier == "winter") {
                        let IVC: masterTableViewController = segue.destinationViewController as masterTableViewController
                        IVC.title = "Winter \(self.title!)"

}
}
}
}
}
}