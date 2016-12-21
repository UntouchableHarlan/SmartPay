//
//  NISetupViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/14/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit

class PayDatesSetupViewController: UITableViewController {
    
    //MARK: - Variables
    
    @IBOutlet var autoClockOnSwitch: UISwitch!
    @IBOutlet var autoClockOffSwitch: UISwitch!
    @IBOutlet var payDayNotificationSwitch: UISwitch!
    @IBOutlet var clockInClockOutNotificationSwitch: UISwitch!
    
    var jobSetUp: JISetUp!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //because of the storyboard issues of adding a button to the navigation controller we will add it programatically
        //creates the next button
        let finishButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(presentNotificationsView) )
        
        //sets the button as the right bar button of the view
        self.navigationItem.rightBarButtonItem = finishButton
        
    }
    
    func presentNotificationsView() {
        //this function will present the job information view controller for set up
        
        // The segue is already set up in the storyboard so we just call the method that will perform that segue
        performSegue(withIdentifier: "PayDatesToNotifications", sender: self.navigationItem.rightBarButtonItem)
        
    }

    
    
}
