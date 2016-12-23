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
    @IBOutlet var payFrequencyLabel: UITableViewCell!
    @IBOutlet var payDayLabel: UITableViewCell!
    @IBOutlet var payPeriodEndLabel: UITableViewCell!
    @IBOutlet var payPeriodStartLabel: UITableViewCell!
    
    
    var jobSetUp: JISetUp!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //because of the storyboard issues of adding a button to the navigation controller we will add it programatically
        //creates the next button
        
        
        
        // let the user clock on and off manually
        let finishButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(presentNotificationsView) )
        
        //sets the button as the right bar button of the view
        self.navigationItem.rightBarButtonItem = finishButton
        
    }
    
    /*overide viewWillApear so that every time the view appears the Pay day labels are updated with the correct days
 
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //When the view appears, set all the labels to their correct days. 
        
        //switch on the different job pay frequencys
        switch jobSetUp.payFrequency {
        case .biWeekly:
            payFrequencyLabel.textLabel?.text = "Bi Weekly"
        case .monthly:
            payFrequencyLabel.textLabel?.text = "Monthly"
        case .weekly:
            payFrequencyLabel.textLabel?.text = "Weekly"
        }
        
        //switch on the different job pay days
        switch jobSetUp.payDay {
        case .monday:
            payDayLabel.textLabel?.text = "Monday"
        case .tuesday:
            payDayLabel.textLabel?.text = "Tuesday"
        case .wednesday:
            payDayLabel.textLabel?.text = "Wednesday"
        case .thursday:
            payDayLabel.textLabel?.text = "Thursday"
        case .friday:
            payDayLabel.textLabel?.text = "Friday"
        case .saturday:
            payDayLabel.textLabel?.text = "Saturday"
        case .sunday:
            payDayLabel.textLabel?.text = "Sunday"
        }
        
        //switch on the different pay period end days
        switch jobSetUp.payPeriodEndDay {
        case .monday:
            payPeriodEndLabel.textLabel?.text = "Monday"
        case .tuesday:
            payPeriodEndLabel.textLabel?.text = "Tuesday"
        case .wednesday:
            payPeriodEndLabel.textLabel?.text = "Wednesday"
        case .thursday:
            payPeriodEndLabel.textLabel?.text = "Thursday"
        case .friday:
            payPeriodEndLabel.textLabel?.text = "Friday"
        case .saturday:
            payPeriodEndLabel.textLabel?.text = "Saturday"
        case .sunday:
            payPeriodEndLabel.textLabel?.text = "Sunday"
        }
        
        //switch on the different pay period start days
        switch jobSetUp.payPeriodStartDay {
        case .monday:
            payPeriodStartLabel.textLabel?.text = "Monday"
        case .tuesday:
            payPeriodStartLabel.textLabel?.text = "Tuesday"
        case .wednesday:
            payDayLabel.textLabel?.text = "Wednesday"
        case .thursday:
            payDayLabel.textLabel?.text = "Thursday"
        case .friday:
            payDayLabel.textLabel?.text = "Friday"
        case .saturday:
            payDayLabel.textLabel?.text = "Saturday"
        case .sunday:
            payDayLabel.textLabel?.text = "Sunday"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /* there are 4 different type of segues for this view controller. All of them leading to the DayPickerViewController (Where the user picks the days). One segue must present the DayPickerViewController with just the PayFrequency, being Weekly, Bi Weekly, Monthly Options. While the others must present Monday-Sunday Options so that they can pick the days. Override this method to let the DayPickerViewController Know how to set up its view.
        */
        
        // get the identifier of the segue that is about to occur
        let identifier = segue.identifier!
        
        //switch upon the different segue identifiers. (There are 4)
        switch identifier {
        case "payFrequencyToPicker":
            // create a reference to the DayPickerViewController and set its variables so it knows how to set up its view and table
            let payFrequencyPickerView = segue.destination as! DayPickerViewController
            payFrequencyPickerView.numberOfSections = 0
            payFrequencyPickerView.numberOfRows = payFrequencyPickerView.payPeriods.count
            payFrequencyPickerView.jobSetUp = self.jobSetUp
            
            print("Setting up DayPickerViewController for Pay Frequency")
            
        case "payDayToPicker":
            //create a reference to the DayPickerViewController and set its variables to it knows how to set up its view and table
            let payDayPickerView = segue.destination as! DayPickerViewController
            payDayPickerView.numberOfSections = 0
            payDayPickerView.numberOfRows = payDayPickerView.days.count
            payDayPickerView.jobSetUp = self.jobSetUp
            
            print("Setting up DayPickerViewController for Pay Day")
            
        case "payPeriodEndToPicker":
            //create a reference to the DayPickerViewcontroller and set its variables so it knows how to set up its view and table
            let payPeriodEndPickerView = segue.destination as! DayPickerViewController
            payPeriodEndPickerView.numberOfSections = 0
            payPeriodEndPickerView.numberOfRows = payPeriodEndPickerView.days.count
            payPeriodEndPickerView.jobSetUp = self.jobSetUp
            
            print("Setting up DayPickerViewController for Pay Period End Day")
            
        case "payPeriodStartToPicker":
            //create a reference to the DayPickerViewcontroller and set its variables so it knows how to set up its view and table
            let payPeriodStartPickerView = segue.destination as! DayPickerViewController
            payPeriodStartPickerView.numberOfSections = 0
            payPeriodStartPickerView.numberOfRows = payPeriodStartPickerView.days.count
            payPeriodStartPickerView.jobSetUp = self.jobSetUp
            
            print("Setting up DayPickerViewController for Pay Period Start Day")
            
        default:
            break
        }
        
        
    }
    
    func presentNotificationsView() {
        //this function will present the job information view controller for set up
        
        // The segue is already set up in the storyboard so we just call the method that will perform that segue
        performSegue(withIdentifier: "PayDatesToNotifications", sender: self.navigationItem.rightBarButtonItem)
        
    }

    
    
}
