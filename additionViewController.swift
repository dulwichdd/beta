//
//  additionViewController.swift
//  beta
//
//  Created by CHRIS WARNER on 30/11/2014.
//  Copyright (c) 2014 CHRIS WARNER. All rights reserved.
//

import UIKit
import CoreData




class additionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    
    
    @IBOutlet var lblref: UILabel!
    
    @IBOutlet var txtcrop: UITextField!
    @IBOutlet var txtvariety: UITextField!
    
    @IBOutlet var txtrows: UITextField!
    @IBOutlet var txtsoiltype: UITextField!
    @IBOutlet var txtharvest: UITextField!
    @IBOutlet var txtdepth: UITextField!
    @IBOutlet var txtspacing: UITextField!
    
    
    var photoFullURL: String!
    var photoThumbURL: String!
    
    
    let noPhotoPNG = "no_photo.png"
    
    var data: Data? = nil
    
    //PHOTOLIB BUTTON
    @IBAction func photolibpressed(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.PhotoLibrary)!
        picker.delegate = self
        picker.allowsEditing = false
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    
    //CANCEL BUTTON
    @IBAction func cancelpressed(sender: AnyObject) {
      self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblref.text = self.title
        self.title = ""
       
        
        if data != nil {
           
            lblref!.text = data?.ref
            txtcrop.text = data?.crop
            txtvariety.text = data?.variety
           
            txtspacing.text = data?.spacing
            txtdepth.text = data?.depth
            txtrows.text = data?.rows
            txtsoiltype.text = data?.soiltype
            txtharvest.text = data?.harvestmonth
            
        }
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //CAMERA 
    @IBAction func camerapressed(sender: AnyObject) {
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){
            let picker = UIImagePickerController()
            picker.sourceType = .Camera
            picker.delegate = self
            picker.allowsEditing = false
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            //no camera available
            let alert = UIAlertController(title: "NO CAMERA", message: "The camera is not available, or there is no camera", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Thank you", style: .Default,
                handler: {(alertAction)in
                    alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

   
    
    //SAVE BUTTON
    @IBAction func savedpressed(sender: AnyObject) {
        if data != nil {
            editTask()
        } else {
            createTask()
        }
        
         self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    //CALL THIS FUNCTION FROM BUTTON PRESSED INSTEAD OF UNDER BUTTON PRESSED
    func createTask() {
        let entityDescripition = NSEntityDescription.entityForName("Data", inManagedObjectContext: managedObjectContext!)
        let task = Data(entity: entityDescripition!, insertIntoManagedObjectContext: managedObjectContext)
       
        task.ref = lblref.text!
        task.crop = txtcrop.text
        task.variety = txtvariety.text
      
        task.spacing = txtspacing.text
        task.depth = txtdepth.text
        task.rows = txtrows.text
        task.soiltype = txtsoiltype.text
        task.harvestmonth = txtharvest.text
        
        let dateFormatter = NSDateFormatter()
        var curLocale: NSLocale = NSLocale.currentLocale()
        var formatString: NSString = NSDateFormatter.dateFormatFromTemplate("EdMMMYYYY h:mm a", options: 0, locale: curLocale)!
        dateFormatter.dateFormat = formatString
        task.date = dateFormatter.stringFromDate(NSDate())
        
        
        //SAVE THE PHOTOPATH TO COREDATA
        if(self.photoFullURL == nil){
            if let URL = NSURL(fileURLWithPath: noPhotoPNG)?.absoluteString{
                task.photoFullURL = URL
                task.photoThumbURL = URL
            }
        }else{
            task.photoFullURL = self.photoFullURL
            task.photoThumbURL = self.photoThumbURL
        }

        managedObjectContext?.save(nil)
        //RESET THE PARAMETERS
        //resetParameters()
    }
    
    func editTask() {
        data?.crop = txtcrop.text
        data?.variety = txtvariety.text
        data?.spacing = txtspacing.text
        data?.depth = txtdepth.text
        data?.rows = txtrows.text
        data?.soiltype = txtsoiltype.text
        data?.harvestmonth = txtharvest.text
        
        if(self.photoFullURL == nil){
            if let URL = NSURL(fileURLWithPath: noPhotoPNG)?.absoluteString{
                data?.photoFullURL = URL
                data?.photoThumbURL = URL
            }
        }else{
            data?.photoFullURL = self.photoFullURL
            data?.photoThumbURL = self.photoThumbURL
        }

        
        
        
        
        managedObjectContext?.save(nil)
    }
    
    //get rid of textpad
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    
    }
    
    
    
    
    
    
    
    @IBOutlet var photoPreview: UIImageView!
    
    // UIImagePickerControllerDelegate Methods
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
        let image: UIImage = info[UIImagePickerControllerOriginalImage] as UIImage
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0), {
            // Scale the original image down before saving it (Good Practice)
            
            // Get the screen size for the target device
            let screenSize: CGSize = UIScreen.mainScreen().bounds.size
            var newImage: UIImage = self.scaledImageWithImage(image, size: CGSize(width: screenSize.width, height: screenSize.height))
            
            dispatch_async(dispatch_get_main_queue(), {
                self.photoPreview.image = newImage
                picker.dismissViewControllerAnimated(true, completion: nil)
            })
            // Get path to the Documents Dir.
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentsDir: NSString = paths.objectAtIndex(0) as NSString
            
            // Get current date and time for unique name
            var dateFormat = NSDateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd-HH-mm-ss"
            let now:NSDate = NSDate(timeIntervalSinceNow: 0)
            let theDate: NSString = dateFormat.stringFromDate(now)
            
            // Set URL for the full screen image
            self.photoFullURL = NSString(format: "/%@.png", theDate)
            
            // Save the full screen image via pngData
            let pathFull: NSString = documentsDir.stringByAppendingString(self.photoFullURL)
            let pngFullData: NSData = UIImagePNGRepresentation(newImage)
            pngFullData.writeToFile(pathFull, atomically: true)
            
            //  Create the thumbnail from the original image
            let thumbnailImage: UIImage = self.scaledImageWithImage(newImage, size: CGSize(width: 100, height: 100))
            self.photoThumbURL = NSString(format: "/%@_THUMB.png", theDate)
            
            // Save the thumbnail image
            let pathThumb: NSString = documentsDir.stringByAppendingString(self.photoThumbURL)
            let pngThumbData: NSData = UIImagePNGRepresentation(thumbnailImage)
            pngThumbData.writeToFile(pathThumb, atomically: true)
        })
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func scaledImageWithImage(image: UIImage, size: CGSize) -> UIImage{
        let scale: CGFloat = max(size.width/image.size.width, size.height/image.size.height)
        let width: CGFloat = image.size.width * scale
        let height: CGFloat  = image.size.height * scale
        let imageRect: CGRect = CGRectMake((size.width-width)/2.0, (size.height - height)/2.0, width, height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        image.drawInRect(imageRect)
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    func resetParameters(){
        self.photoFullURL = nil
        //txtWeight.text = ""
        self.photoPreview.image = UIImage(named: noPhotoPNG)
    }
    
    
}
