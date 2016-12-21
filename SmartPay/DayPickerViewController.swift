//
//  DayPickerViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/15/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit

class DayPickerViewController: UITableViewController {
    
    var numberOfRows: Int!
    var numberOfSections: Int!
    var tableViewStyle: UITableViewStyle!
    let weekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let payFrequency = ["Weekly","Bi Weekly", "Monthly"]
    var useWeekDaysArray: Bool!
    var jobSetUp:JISetUp!
    
    override func viewWillAppear(_ animated: Bool) {

        if let currentS = jobSetUp.currentSceen {
   
            print("The Current Screen is \(currentS.rawValue)")
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        jobSetUp.currentSceen = nil
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        if useWeekDaysArray == true {
            cell.textLabel?.text = weekDays[indexPath.row]
        
        } else {
            cell.textLabel?.text = payFrequency[indexPath.row]
        
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Unwrap the current screen optional to know which screen the user is choosing in
        
        let currentScreen = jobSetUp.currentSceen!
        
        switch currentScreen {
        case .frequency:
            // The user is on the frequency screen. Switch below will determine what cell was selected and set the pay frequency
            switch indexPath.row{
            case 0:
                jobSetUp.payFrequency = .weekly
            case 1:
                jobSetUp.payFrequency = .biWeekly
            case 2:
                jobSetUp.payFrequency = .monthly
            default:
                break
            }
        
        case .payDay:
            // The user is on the pay day screen. Switch below will determine what cell was selected and set the pay day
            switch indexPath.row {
            case 0:
                jobSetUp.payDay = .sunday
            case 1:
                jobSetUp.payDay = .monday
            case 2:
                jobSetUp.payDay = .tuesday
            case 3:
                jobSetUp.payDay = .wednesday
            case 4:
                jobSetUp.payDay = .thursday
            case 5:
                jobSetUp.payDay = .friday
            case 6:
                jobSetUp.payDay = .saturday
            default:
                break
            }
            
        case .payPeriodEnd:
            // The user is on the pay period end screen. Switch below wull determine what cell was selected and set the pay period end day
            switch indexPath.row {
            case 0:
                jobSetUp.payPeriodEndDay = .sunday
            case 1:
                jobSetUp.payPeriodEndDay = .monday
            case 2:
                jobSetUp.payPeriodEndDay = .tuesday
            case 3:
                jobSetUp.payPeriodEndDay = .wednesday
            case 4:
                jobSetUp.payPeriodEndDay = .thursday
            case 5:
                jobSetUp.payPeriodEndDay = .friday
            case 6:
                jobSetUp.payPeriodEndDay = .saturday
            default:
                break
            }
            
        case.payPeriodStart:
            switch indexPath.row {
            case 0:
                jobSetUp.payPeriodStartDay = .sunday
            case 1:
                jobSetUp.payPeriodStartDay = .monday
            case 2:
                jobSetUp.payPeriodStartDay = .tuesday
            case 3:
                jobSetUp.payPeriodStartDay = .wednesday
            case 4:
                jobSetUp.payPeriodStartDay = .thursday
            case 5:
                jobSetUp.payPeriodStartDay = .friday
            case 6:
                jobSetUp.payPeriodStartDay = .saturday
            default:
                break
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
