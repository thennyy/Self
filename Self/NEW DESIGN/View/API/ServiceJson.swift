//
//  Service.swift
//  Self
//
//  Created by Thenny Chhorn on 9/22/22.
//

import UIKit
import CoreData
struct ServiceJson {
    
    static func getJSONFile(forName name: String, completion: @escaping([QuoteModel]) -> Void) {

        guard let path = Bundle.main.path(forResource: name, ofType: "json") else {return}
        
        do {
            let jsonString = try String(contentsOfFile: path, encoding: .utf8)
            let jsonData: Data = jsonString.data(using: .utf8)!
            let documents = try JSONDecoder().decode([QuoteModel].self, from: jsonData)
           
            completion(documents)
            
        } catch {
            print(error)
        }
        
    }
 

}
