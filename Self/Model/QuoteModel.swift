//
//  QuoteModel.swift
//  Self
//
//  Created by Thenny Chhorn on 9/22/22.
//

import UIKit

struct QuoteModel: Decodable {
    let quote: String
    let author: String
    var isSaved: Bool?
    init(quote: String, author: String) {
        self.quote = quote
        self.author = author
    }
   
}
