//
//  DayPickerViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/15/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit

class DayPickerViewController: UITableViewController {
    
    //MARK: - Variables 
    var jobSetUp: JISetUp!
    let days:[String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday"]
    let payPeriods: [String] = ["Weekly", "Bi Weekly", "Monthly"]
    var numberOfRows: Int!
    var numberOfSections: Int!
    

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    
}
