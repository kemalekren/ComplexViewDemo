//
//  ProductModel.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

struct ProductModel {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var imageName: String
}
