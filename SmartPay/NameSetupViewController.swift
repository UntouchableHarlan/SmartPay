//
//  PISetupViewController.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/14/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import UIKit

class NameSetupViewController: UIViewController {
    
    //MARK: - Variables
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    // When the user gets to the name setup screen. Create and initailze a JISetUp object to be passed around throughout the set up proccess
    var jobSetUp: JISetUp = JISetUp()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //because of the storyboard issues of adding a button to the navigation controller we will add it programatically 
        //creates the next button
        let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(presentTaxView) )
        
        //sets the button as the right bar button of the view
        self.navigationItem.rightBarButtonItem = nextButton

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // as soon as the user clicks get started and the PIView appears make the firstName textfield become the first repsonder
        self.firstNameTextField.becomeFirstResponder()
        
    }
    
    func presentTaxView() {
        //this function will present the job information view controller for set up
        
        //start assinging job its properties
        if ((firstNameTextField.text?.isEmpty)! || (lastNameTextField.text?.isEmpty)!) == true{
            
            print("Text field is empty")

        } else {
            
            
            jobSetUp.setName(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
            
            // The segue is already set up in the storyboard so we just call the method that will perform that segue
            performSegue(withIdentifier: "nameInfoToTaxInfo", sender: self.navigationItem.rightBarButtonItem)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "nameInfoToTaxInfo" {
            let jobSetupVC = segue.destination as! TaxSetupViewController
            jobSetupVC.jobSetUp = self.jobSetUp
            print("Job setup object is being passed through the segue.")
            print("Job Object Current Info - First Name: \(jobSetUp.firstName) Last Name: \(jobSetUp.lastName)")
        }
    }
}
