//
//  ProductsRepository.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 19/04/24.
//

import Foundation

class ProductsRepository {
    func loadProducts() -> [Product]? {
        guard let path = Bundle.main.path(forResource: "products", ofType: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let products = try decoder.decode([Product].self, from: data)
            return products
        } catch {
            print("Error loading product data: \(error.localizedDescription)")
            return nil
        }
    }
}
