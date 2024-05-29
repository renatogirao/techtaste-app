//
//  Product.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 19/04/24.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    let category: Category
    
    var formattedPrice: String {
        return "R$ " + price.formatPrice()
    }
}
