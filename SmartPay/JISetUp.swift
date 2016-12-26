//
//  JISetUp.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/30/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import Foundation

class JISetUp: Job {
    
    
    // JISetUp is a subclass of Job. This class will be passed around through the initial set up proccess. It hold all the same variables as Job that will be eventually passed through to the actual job object whenever it is finally created.
    
    var currentSceen: CurrentPickerScreen?
    
    enum CurrentPickerScreen: String {
        case frequency = "frequency"
        case payPeriodEnd = "payPeriodEnd"
        case payPeriodStart = "payPeriodStart"
        case payDay = "payDay"
    }
    
    func transferToJobObject(job: Job) {
        // This method will transfer all the information that was passed through the job set up object into the real job object that will be used by the application 
        
        job.firstName = self.firstName
        job.lastName = self.lastName
        job.companyName = self.companyName
        job.hourlyPay = self.hourlyPay
        job.payFrequency = self.payFrequency
        job.payDay = self.payDay
        job.payPeriodEndDay = self.payPeriodEndDay
        job.payPeriodStartDay = self.payPeriodStartDay
        job.stateForWitholding = self.stateForWitholding
        job.exemptFrom = self.exemptFrom
        job.numberOfFederalAllowences = self.numberOfFederalAllowences
        job.additionalFederalWitholding = self.additionalFederalWitholding
        job.filingStatus = self.filingStatus
        
    }
    
}
