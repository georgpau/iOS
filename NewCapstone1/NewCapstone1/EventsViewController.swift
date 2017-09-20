//
//  EventsViewController.swift
//  newCapstone
//
//  Created by Xcode User on 2017-09-18.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit


class EventsViewController: UIViewController {
    let URL_HEROES = "http://capstoneprototypeqci.azurewebsites.net/api/EventsAPI/1";
    
    
    //the label we create
    @IBOutlet weak var labelName: UILabel?
    @IBOutlet weak var txtDescription: UITextView?
    @IBOutlet weak var btnName:UIButton?
    
    var eventId:Int?
    var eventName:String?
    var eventDescription:String?
    var eventLocation:String?
    var eventTime:String?
    
    
    
    
    @IBAction func unwindtoThisViewController(segue:UIStoryboardSegue){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("hello")
         getJsonFromUrl();
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButtons(sender: UIButton){
        
    }
    
    
    
    
    func getJsonFromUrl(){
        //creating a NSURL
        
        let url = NSURL(string: URL_HEROES)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "Name")!)
                self.eventName=String(describing: jsonObj!.value(forKey: "Name")!)
                self.eventDescription=String(describing: jsonObj!.value(forKey: "Description")!)
                self.eventLocation=String(describing:jsonObj!.value(forKey: "Location")!)
                self.eventTime=String(describing:jsonObj!.value(forKey: "Time")!)
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.eventName=self.eventName
                appDelegate.eventDescription=self.eventDescription
                appDelegate.eventLocation=self.eventLocation
                appDelegate.eventTime=self.eventTime
                
                DispatchQueue.main.async(execute: {
                    self.btnName?.setTitle(self.eventName, for: .normal)
                    self.txtDescription?.text=self.eventDescription
                })
                
                
                
                
                

                
                OperationQueue.main.addOperation({
                    
                    
                  
                })
            }
        }).resume()
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
