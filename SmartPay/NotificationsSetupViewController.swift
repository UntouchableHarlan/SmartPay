//
//  NotificationsSetupViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 12/21/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit
import CoreLocation
class NotificationsSetupViewController: UITableViewController, CLLocationManagerDelegate {
    @IBOutlet var autoClockOnSwitch: UISwitch!
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    
    func finishedButtonPressed() {
       // compile all the data
        
    }
    
    func nextButtonPressed() {
        // segue to address controller
        performSegue(withIdentifier: "NotificationToAddress", sender: self.navigationItem.rightBarButtonItem)
    }

    
    @IBAction func autoClockON(_ sender: UISwitch) {
        
        let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonPressed))
        
        let finishButton = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(finishedButtonPressed))
        
        if sender.isOn {
            requestLocationAuthorization()
        } else {
   
        }
        
        
    
        

    }

    func requestLocationAuthorization() {
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if authorizationStatus != .authorizedAlways {
            
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedAlways {
            autoClockOnSwitch.setOn(true, animated: true)
        } else {
            autoClockOnSwitch.setOn(false, animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonPressed))
        
        self.navigationItem.rightBarButtonItem = nextButton
        
        locationManager.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
