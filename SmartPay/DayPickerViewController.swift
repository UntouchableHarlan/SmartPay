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
    var displayDays: Bool!
    let payDays:[String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday"]
    let payPeriods: [String] = ["Weekly", "Bi Weekly", "Monthly"]
    var numberOfRows: Int!
    var numberOfSections: Int!
    var currentScreen: SelectedScreen!
    
    enum SelectedScreen {
        case payFrequency
        case payDay
        case payPeriodStart
        case payPeriodEnd
    }

    //MARK: - Custom Functions
    
    
    func getCell(index: Int) -> IndexPath {
        
        let indexPath = IndexPath.init(row: index, section: 0)
        
        return indexPath
    }
    
    // This function removes the old checkmark and adds a new check mark in whatever position is passed into the index argument
    func addNewCheckMark(index: IndexPath, tableView: UITableView){
        
        // Checks to see if the current screen is the pay frequency screen.
        if currentScreen! == .payFrequency {

            //create an empty array that will hold the type UITableViewCell
            var cellArray:[UITableViewCell] = []
            
            //run a for loop 3 times because there are 3 individual cells in the pay frequency view. Each time the loop runs, get the cell of the current index and add it to the cellArray
            for cell in 0...payPeriods.count-1 {
                let cellLoop = tableView.cellForRow(at:getCell(index: cell))
                cellArray.append(cellLoop!)
            }
            
            // After the array has been populated. Run a for loop again to set the accessory type of all the cells in the array to none. Which will make sure no cell has a check mark
            for cell in cellArray {
                cell.accessoryType = .none
            }
            
            // get the cell to add a check mark, then add the check mark to the cell and deselect the cell after the check mark has been applied.
            let cellToAddCheckMark = tableView.cellForRow(at: index)
            cellToAddCheckMark?.accessoryType = .checkmark
            tableView.deselectRow(at: index, animated: true)
        } else {
            x
            //if the screen is not the pay frequency screen but it is one of the other screens that shows weekdays
            var cellArray:[UITableViewCell] = []
            for cell in 0...payDays.count-1 {
                let cellLoop = tableView.cellForRow(at:getCell(index: cell))
                cellArray.append(cellLoop!)
            }
            
            for cell in cellArray {
                cell.accessoryType = .none
            }
            let cellToAddCheckMark = tableView.cellForRow(at: index)
            cellToAddCheckMark?.accessoryType = .checkmark
            tableView.deselectRow(at: index, animated: true)

        }
    }
    
    func setNewFrequency(indexPath: IndexPath) {
        
        // when this function is called, it is passed in a indexPath of the pay frequency to change. If the user selects row 1 from the table view, we set the current pay frequency to now be WEEKLY because thats what the user selected as thier pay frequency. 
        
        switch indexPath.row {
        case 0:
            
            jobSetUp.payFrequency = .weekly
            
        case 1:
            
            jobSetUp.payFrequency = .biWeekly
            
        case 2:
            
            jobSetUp.payFrequency = .monthly
        
        default:
            break
        }
        
    }
    
    
    
    func setNewDay(indexPath: IndexPath){
        
        switch currentScreen! {
        case .payDay:
            
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
        
        case .payPeriodStart:
            
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
            
        default:
            break
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    // when the table view appears we switch on the current screen(to determine what screen the user is viewing). Then once we determine what sceen the user is viewing, we then switch on the Job object. For example we determined the user is on the pay frequency screen. So now we must figure out what is the pay frequency that is currently set. Once we find out what the current pay frequency is set to we get the cell at the index and set its cell accessoryType to have a check mark.
        
        //switch on the current screen
        switch self.currentScreen! {
            
            //if the current screen is the PAY FREQUENCY screen
        case .payFrequency:
            
            //switch on the job objects pay frequency or the users current pay frequency
            switch jobSetUp.payFrequency {
                
                //if the pay frequency is currently set to weekly
            case .weekly:
                
                //get the cell in the first position
                let cell = tableView.cellForRow(at: getCell(index: 0))
                
                //set the cells accessory type to a checkmark
                cell?.accessoryType = .checkmark
                
                // if the pay frequency is currently set to Bi weekly
            case .biWeekly:
                
                //get the cell in the second position
                let cell = tableView.cellForRow(at: getCell(index: 1))
                
                //set the cells accessory type to a checkmark
                cell?.accessoryType = .checkmark
                
            case .monthly:
                let cell = tableView.cellForRow(at: getCell(index: 2))
                cell?.accessoryType = .checkmark
            }
        case .payDay:
            switch jobSetUp.payDay {
            case .sunday:
                let cell = tableView.cellForRow(at: getCell(index: 0))
                cell?.accessoryType = .checkmark
                
            case .monday:
                let cell = tableView.cellForRow(at: getCell(index: 1))
                cell?.accessoryType = .checkmark

            case .tuesday:
                let cell = tableView.cellForRow(at: getCell(index: 2))
                cell?.accessoryType = .checkmark
            case .wednesday:
                let cell = tableView.cellForRow(at: getCell(index: 3))
                cell?.accessoryType = .checkmark
                
            case .thursday:
                let cell = tableView.cellForRow(at: getCell(index: 4))
                cell?.accessoryType = .checkmark
                
            case .friday:
                let cell = tableView.cellForRow(at: getCell(index: 5))
                cell?.accessoryType = .checkmark
            case .saturday:
                let cell = tableView.cellForRow(at: getCell(index: 6))
                cell?.accessoryType = .checkmark
            }
        case .payPeriodStart:
            switch jobSetUp.payPeriodStartDay {
            case .sunday:
                let cell = tableView.cellForRow(at: getCell(index: 0))
                cell?.accessoryType = .checkmark
                
            case .monday:
                let cell = tableView.cellForRow(at: getCell(index: 1))
                cell?.accessoryType = .checkmark
                
            case .tuesday:
                let cell = tableView.cellForRow(at: getCell(index: 2))
                cell?.accessoryType = .checkmark
            case .wednesday:
                let cell = tableView.cellForRow(at: getCell(index: 3))
                cell?.accessoryType = .checkmark
                
            case .thursday:
                let cell = tableView.cellForRow(at: getCell(index: 4))
                cell?.accessoryType = .checkmark
                
            case .friday:
                let cell = tableView.cellForRow(at: getCell(index: 5))
                cell?.accessoryType = .checkmark
            case .saturday:
                let cell = tableView.cellForRow(at: getCell(index: 6))
                cell?.accessoryType = .checkmark
            }
            
        case .payPeriodEnd:
            switch jobSetUp.payPeriodEndDay {
            case .sunday:
                let cell = tableView.cellForRow(at: getCell(index: 0))
                cell?.accessoryType = .checkmark
                
            case .monday:
                let cell = tableView.cellForRow(at: getCell(index: 1))
                cell?.accessoryType = .checkmark
                
            case .tuesday:
                let cell = tableView.cellForRow(at: getCell(index: 2))
                cell?.accessoryType = .checkmark
            case .wednesday:
                let cell = tableView.cellForRow(at: getCell(index: 3))
                cell?.accessoryType = .checkmark
                
            case .thursday:
                let cell = tableView.cellForRow(at: getCell(index: 4))
                cell?.accessoryType = .checkmark
                
            case .friday:
                let cell = tableView.cellForRow(at: getCell(index: 5))
                cell?.accessoryType = .checkmark
            case .saturday:
                let cell = tableView.cellForRow(at: getCell(index: 6))
                cell?.accessoryType = .checkmark
            }
        }
        
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //check to see what kind of table view/ screen we are displaying
        if currentScreen == .payFrequency {
            
            // if the current screen is the payFrequency screen, set the labels to the strings in the pay periods array
            cell?.textLabel?.text = payPeriods[indexPath.row]
            
        } else {
            
            //if the current screen is not the payFrequency screen the set the labels to the strings in the payDays array
            cell?.textLabel?.text = payDays[indexPath.row]
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // call the add check mark function to add a checkmark to the selected cell
        addNewCheckMark(index: indexPath, tableView: tableView)

        // once the checkmark function has been called and the check mark has been added, check to see what screen the user is being presented. If it is the pay frequency screen(which only has 3 cells, weekly,biweekly, monthly) then call the "setNewFrequency" Function to update the job object to reflect the users selection. If it is a screen that displays the weekdays call the other function and it will determine what screen they are on and handle the rest.
        if currentScreen! == .payFrequency {
            setNewFrequency(indexPath: indexPath)
        } else {
            setNewDay(indexPath: indexPath)
        }
    }
    
    
}
