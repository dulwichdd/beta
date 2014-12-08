//
//  cropsViewController.swift
//  beta
//
//  Created by CHRIS WARNER on 30/11/2014.
//  Copyright (c) 2014 CHRIS WARNER. All rights reserved.
//

import UIKit

class cropsViewController: UIViewController {

    @IBAction func homepressed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBOutlet var lblseasons: UILabel!
    @IBOutlet var imgcrops: UIImageView!
    @IBOutlet var lblcrops: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.title == "Peas"){
            lblcrops.text = "Peas are a cool season crop, enjoying temperatures of 13 -18C (55-64F) so they are well suited to the UK climate. Peas can be direct sown outdoors from March to June once the soil has warmed to about 10C (50F). Using cloches will help the earliest crops to germinate."
           lblseasons.text = "March, April, May, June"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
