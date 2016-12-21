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
    

    
}
