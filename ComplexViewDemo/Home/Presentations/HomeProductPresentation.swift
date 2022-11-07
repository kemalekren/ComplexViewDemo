//
//  HomeProductPresentation.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

struct HomeProductPresentation: Hashable {
    var id: String
    var title: String
    var description: String
    var price: String
    var imageName: String
    
    init(product: ProductModel) {
        self.id = product.id
        self.title = product.title
        self.description = product.description
        self.price = product.price
        self.imageName = product.imageName
    }
    
    static func == (lhs: HomeProductPresentation, rhs: HomeProductPresentation) -> Bool {
        lhs.id == rhs.id
    }
}
