//
//  Category.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 19/04/24.
//

import Foundation

enum Category: String, Decodable {
    case snack
    case main
    case pasta
    case dessert
    case drink
    
    var title: String {
        switch self {
        case .snack:
            return "Aperitivos"
        case .main:
            return "Principais"
        case .pasta:
            return "Massas"
        case .dessert:
            return "Sobremesas"
        case .drink:
            return "Bebidas"
        }
    }
}
