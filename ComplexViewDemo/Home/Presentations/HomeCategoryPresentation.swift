//
//  HomeCategoryPresentation.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

struct HomeCategoryPresentation: Hashable {
    var id: String
    var title: String
    var imageName: String
    
    init(category: CategoriesModel) {
        self.id = category.id
        self.title = category.title
        self.imageName = category.imageName
    }
    
    static func == (lhs: HomeCategoryPresentation, rhs: HomeCategoryPresentation) -> Bool {
        lhs.id == rhs.id
    }
}
