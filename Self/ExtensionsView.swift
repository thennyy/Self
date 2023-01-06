//
//  ExtensionsView.swift
//  SeekSupport
//
//  Created by Thenny Chhorn on 7/9/20.
//  Copyright © 2020 Thenny Chhorn. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
extension Date {
    
    func timeAgoDisplay() -> String {
        
      //  let secondsAgo = Int(Date().timeIntervalSince(self))
        let timesAgo = Date().timeIntervalSince(self)
        let secondsAgo = Int(timesAgo)
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        
        var returnValue: String
        
        var quotient: Int
        let unit: String
       
        if secondsAgo < minute {
            quotient = secondsAgo
                   if quotient == 0 {
                       quotient = 1
                }
            
            unit = "second"
            returnValue = "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
        } else if secondsAgo < hour {
            quotient = secondsAgo / minute
                   if quotient == 0 {
                       quotient = 1
                   }
            
            unit = "min"
            returnValue = "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
        } else if secondsAgo < day {
            quotient = secondsAgo / hour
                   if quotient == 0 {
                       quotient = 1
                   }
            
            unit = "hour"
            returnValue = "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
        } else if secondsAgo < week {
            quotient = secondsAgo / day
            unit = "day"
                   if quotient == 0 {
                       quotient = 1
                   }
            
            returnValue = "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
        } else if secondsAgo < month {
            
            quotient = secondsAgo / week
            unit = "week"
                   if quotient == 0 {
                       quotient = 1
                   }
            
            returnValue = "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
            
        }else {
            
            quotient = secondsAgo / month
            unit = "month"
                   if quotient == 0 {
                       quotient = 1
                   }
            
            returnValue = "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
            
        }
  
        return returnValue
        
    }
}


