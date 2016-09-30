//
//  RealmDataModel.swift
//  FYI Mileage
//
//  Created by Mobileware on 9/30/16.
//  Copyright © 2016 Mobileware. All rights reserved.
//

import UIKit
import RealmSwift

enum Gender: Int {
    case Male        = 0
    case Female      = 1
    case Complicated = 2
}

class RealmObject: Object {
    dynamic var UUID = ""
}

class MileageLog: RealmObject {
    dynamic var type = ""
    
}

class Location: RealmObject {
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    dynamic var address: String?
}

class Driver: RealmObject {
    dynamic var firstName: String   = ""
    dynamic var lastName: String    = ""
    dynamic var middleName: String?
    private dynamic var genderRawValue: Int = 0
    
    var gender: Gender {
        get {
            if let driverGender = Gender(rawValue: genderRawValue) {
                return driverGender
            }
            return .Male
        }
        set (newValue) {
            self.genderRawValue = newValue.rawValue
        }
    }
    
    override static func primaryKey() -> String? {
        return "UUID"
    }
    
    override static func indexedProperties() -> [String] {
        return []
    }
    
    override static func ignoredProperties() -> [String] {
        return ["genderRawValue"]
    }
}

class Car: RealmObject {
    dynamic var make: String  = ""
    dynamic var year: String  = ""
    dynamic var model: String = ""
    dynamic var color: String = ""
    
    init(make: String, year: String, model: String, color: String) {
        self.make  = make
        self.year  = year
        self.model = model
        self.color = color
    }
}

//class Trip: RealmObject {
//    dynamic var type: String     = ""
//    dynamic var name: String     = ""
//    dynamic var driver: String   = ""
//    dynamic var car: String      = ""
//    dynamic var status: String   = ""
//    dynamic var unit: String     = ""
//    dynamic var notes: String    = ""
//    dynamic var duration: String = ""
//    dynamic var currency: String = ""
//    dynamic var ixStatus: String = ""
//    
//    dynamic var startMile: Int   = 0
//    dynamic var endMile: Int     = 0
//    dynamic var distance: Int    = 0
//    dynamic var selectCount: Int = 0
//    
//    dynamic var rate: Double         = 0.0
//    dynamic var amount: Double       = 0.0
//    dynamic var otherExpense: Double = 0.0
//    dynamic var totalExpense: Double = 0.0
//    dynamic var exchangeRate: Double = 0.0
//    
//    dynamic var startTime: NSDate   = NSDate()
//    dynamic var endTime: NSDate = NSDate()
//    dynamic var destination: Location
//    
//}
