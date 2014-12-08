//
//  ViewController.swift
//  beta
//
//  Created by CHRIS WARNER on 30/11/2014.
//  Copyright (c) 2014 CHRIS WARNER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "bed1") {
            let IVC: seasonViewController = segue.destinationViewController as seasonViewController
            IVC.title = "Bed 1"
            
        }else{
            if (segue.identifier == "bed2") {
                let IVC: seasonViewController = segue.destinationViewController as seasonViewController
                IVC.title = "Bed 2"
                
            }else{
                if (segue.identifier == "bed3") {
                    let IVC: seasonViewController = segue.destinationViewController as seasonViewController
                    IVC.title = "Bed 3"
                }else{
                    if (segue.identifier == "bed4") {
                        let IVC: seasonViewController = segue.destinationViewController as seasonViewController
                        IVC.title = "Bed 4"
                        
                    }else{
                        if (segue.identifier == "bed5") {
                            let IVC: seasonViewController = segue.destinationViewController as seasonViewController
                            IVC.title = "Bed 5"

}
}
}
}
}
}
}

