//
//  Database.swift
//  Attender
//
//  Created by Nathan Lanier on 10/4/15.
//  Copyright © 2015 Nathan Lanier. All rights reserved.
//

import Foundation
import UIKit

class Master {
    var orgs = [Organization] ()
    
    func size () -> Int {
        var i : Int = 0
        while orgs[i].name != "" {
            i++
        }
        return(i)
    }
    func add (newOrg : Organization) {
        orgs[size()] = newOrg
    }
    
    init (orgs: [Organization]) {
        self.orgs = orgs
    }
}

class Organization {
    
    var name: String = ""
    var day : String = ""
    var url : String = ""
    
    init (name : String, day : String, url : String) {
        self.name = name
        self.day = day
        self.url = url
    }
}

class Member {
    
    var name : String = ""
    var clss : Int = 0
    var orgOf : String = ""
    var attendance : Int = 0
    
    init (name : String, clss : Int, orgOf : String, attendance : Int) {
        self.name = name
        self.clss = clss
        self.orgOf = orgOf
        self.attendance = attendance
    }
    
}

class Meeting {
    
    var strDate : String = ""
    
    init (strDate : String) {
        self.strDate = strDate
    }
}