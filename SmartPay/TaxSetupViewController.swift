//
//  JISetupViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/14/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit

class TaxSetupViewController: UIViewController {
    
    // MARK: - Variables
    
    @IBOutlet var companyNameTextField: UITextField!
    @IBOutlet var hourlyPay: UITextField!

    
    var jobSetUp: JISetUp!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //because of the storyboard issues of adding a button to the navigation controller we will add it programatically
        //creates the next button
        let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(presentPayDates))
        
        //sets the button as the right bar button of the view
        self.navigationItem.rightBarButtonItem = nextButton
        
        print("Job object has been passed with Name: \(jobSetUp.firstName + "" + jobSetUp.lastName)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        /*
        switch jobSetUp.payFrequency {
        case .biWeekly:
            self.payFrequencyLabel.text = "Bi Weekly"
        case .weekly:
            self.payFrequencyLabel.text = "Weekly"
        case .monthly:
            self.payFrequencyLabel.text = "Monthly"
        }
        
        switch jobSetUp.payDay {
        case .sunday:
            self.payDayLabel.text = "Sunday"
        case .monday:
            self.payDayLabel.text = "Monday"
        case .tuesday:
            self.payDayLabel.text = "Tuesday"
        case .wednesday:
            self.payDayLabel.text = "Wednesday"
        case .thursday:
            self.payDayLabel.text = "Thursday"
        case .friday:
            self.payDayLabel.text = "Friday"
        case .saturday:
            self.payDayLabel.text = "Saturday"
        }
        
        switch jobSetUp.payPeriodEndDay {
        case .sunday:
            self.payPeriodEndLabel.text = "Sunday"
        case .monday:
            self.payPeriodEndLabel.text = "Monday"
        case .tuesday:
            self.payPeriodEndLabel.text = "Tuesday"
        case .wednesday:
            self.payPeriodEndLabel.text = "Wednesday"
        case .thursday:
            self.payPeriodEndLabel.text = "Thursday"
        case .friday:
            self.payPeriodEndLabel.text = "Friday"
        case .saturday:
            self.payPeriodEndLabel.text = "Saturday"
        }
    
        switch jobSetUp.payPeriodStartDay {
        case .sunday:
            self.payPeriodStartLabel.text = "Sunday"
        case .monday:
            self.payPeriodStartLabel.text = "Monday"
        case .tuesday:
            self.payPeriodStartLabel.text = "Tuesday"
        case .wednesday:
            self.payPeriodStartLabel.text = "Wednesday"
        case .thursday:
            self.payPeriodStartLabel.text = "Thursday"
        case .friday:
            self.payPeriodStartLabel.text = "Friday"
        case .saturday:
            self.payPeriodStartLabel.text = "Saturday"
        }
        */
    }
    
   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) Row: \(indexPath.row)" )
        
        // switch on the selected index path so we know which cell was selected so we can assign the current screen variable
        
        switch indexPath.section {
        case 3:
            jobSetUp.currentSceen = .frequency
            print("User is choosing pay frequency")
        case 4:
            jobSetUp.currentSceen = .payDay
            print("User is choosing pay day")
        case 5:
            jobSetUp.currentSceen = .payPeriodEnd
            print("User is choosing pay period end day")
        case 6:
            jobSetUp.currentSceen = .payPeriodStart
            print("User is choosing pay period start day")
        default:
            print("Another row was selected")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
 
    }*/

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let identifier = segue.identifier!
        
        switch identifier {
        case "TaxInfoToPayDates":
                let payDatesViewController = segue.destination as! PayDatesSetupViewController
            payDatesViewController.jobSetUp = self.jobSetUp
        
        default:
            break
        }
        
        
        }

    func presentPayDates() {
        
        // This function will present the Pay Dates View Controller
        
        performSegue(withIdentifier: "TaxInfoToPayDates", sender: self.navigationItem.rightBarButtonItem)
    }
    
    var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        return nf
    }

}


    
  /*  func presentNIView() {
        //this function will present the job information view controller for set up
        
        
        if (companyNameTextField.text?.isEmpty)! || (taxPercentageTextField.text?.isEmpty)! || (hourlyPay.text?.isEmpty)! {
            
            // If any of the text fields are empty just present a alert
            
            let alertCon  = UIAlertController(title: "Missing or incorrect Field", message: "One or more fields are missing or has incorrect info please fix", preferredStyle: .alert)
            let alert = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertCon.addAction(alert)
            self.present(alertCon, animated: true, completion: nil)
        } else {
            
            // The segue is already set up in the storyboard so we just call the method that will perform that segue and also set the hourly pay, company name and tax percentage
            
            // Set the company name
            let companyName = companyNameTextField.text!
            jobSetUp.companyName = companyName
            
            // Set the hourly pay
            let hourlyPay = self.hourlyPay.text
            let hourlyPayConverted = numberFormatter.number(from: hourlyPay!)
            jobSetUp.hourlyPay = hourlyPayConverted?.doubleValue
            
            
            
            
            performSegue(withIdentifier: "jobInfoToNotiSetup", sender: self.navigationItem.rightBarButtonItem)
            
            
        }
    }*/


