//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Renato Savoia Girão on 25/09/24.
//

import UIKit

class ProductsListViewModel {
    
    var products: [Product] = []
    private var productsRepository: ProductsRepository

    init(productsRepository: ProductsRepository = ProductsRepository()) {
        self.productsRepository = productsRepository
    }
    
    func getAllProducts() {
        if let products = productsRepository.loadProducts() {
            self.products = products
        }
    }
    func getNumberOfRowsOfTableView() -> Int {
        return products.count
    }
    
}
