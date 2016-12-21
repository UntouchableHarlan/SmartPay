//
//  Job.swift
//  SmartPay
//
//  Created by Davone Barrett on 11/14/16.
//  Copyright © 2016 Smarter Apps. All rights reserved.
//

import Foundation

class Job {
    
    //MARK: - Job Item Variables
   
    var firstName: String!
    var lastName: String!
    var companyName: String!
    var address: String!
    var city: String!
    var state: String!
    var zip: Int!
    var hourlyPay: Double!
    var taxPercentage: Double?
    var recievePayAmountNotificationNumberOfDaysBefore: Int!
    var recieveNotificationWhenClockingInAndOut: Bool!
    var autoClockOnAndOff: Bool!
    var payFrequency: Frequency = .biWeekly
    var payDay: Day = .friday
    var payPeriodStartDay: Day = .sunday
    var payPeriodEndDay:Day = .saturday
    
    enum Frequency {
        case weekly
        case biWeekly
        case monthly
    }
    
    enum Day {
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }
    
    enum StateForWitholding {
        case alabama
        case alaska
        case arizona
        case arkansas
        case california
        case colorado
        case connecticut
        case delaware
        case florida
        case georgia
        case hawaii
        case idaho
        case illinois
        case indiana
        case iowa
        case kansas
        case kentucky
        case louisiana
        case maine
        case maryland
        case massachusetts
        case michigan
        case minnesota
        case mississippi
        case missouri
        case montana
        case nebraska
        case nevada
        case newHampshire
        case newjersey
        case newMexico
        case newYork
        case northCarolina
        case northDakota
        case ohio
        case oklahoma
        case oregon
        case pennsylvania
        case rhodeIsland
        case southCarolina
        case southDakota
        case tennessee
        case texas
        case utah
        case vermont
        case virginia
        case washington
        case westVirginia
        case wisconsin
        case wyoming
    }
    
    enum Exemptions {
        case federalTax
        case fica
        case medicare
    }
    
    func setName(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}
