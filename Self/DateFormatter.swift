//
//  DateFormatter.swift
//  Self
//
//  Created by Thenny Chhorn on 1/20/21.
//

import UIKit

extension Date {
    
    func dayoftheWeek() -> String  {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
        
    }
    
    func monthOfYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
        
    }
    func dayofMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
   
}
