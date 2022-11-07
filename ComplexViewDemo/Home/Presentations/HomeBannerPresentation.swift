//
//  HomeBannerPresentation.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation


struct HomeBannerPresentation: Hashable {
    var id: String
    var imageName: String
    
    init(banner: BannerModel) {
        self.id = banner.id
        self.imageName = banner.imageName
    }
    
    static func == (lhs: HomeBannerPresentation, rhs: HomeBannerPresentation) -> Bool {
        lhs.id == rhs.id
    }
}
