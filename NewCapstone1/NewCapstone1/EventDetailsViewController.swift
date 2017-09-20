//
//  EventDetailsViewController.swift
//  NewCapstone1
//
//  Created by Xcode User on 2017-09-19.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var txtDescription:UITextView?
    @IBOutlet weak var lblLocation:UILabel?
    @IBOutlet weak var lblTime:UILabel?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    @IBAction func unwindtoThisViewController(segue:UIStoryboardSegue){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblName?.text=appDelegate.eventName
        self.txtDescription?.text=appDelegate.eventDescription;
        self.lblLocation?.text=appDelegate.eventLocation;
        lblTime?.text=appDelegate.eventTime;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
