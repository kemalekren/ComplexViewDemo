//
//  HomePresentation.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

enum HomeSection: Hashable {
    case campaign(_ campaing: HomeCampaignPresentation)
    case category(_ category: HomeCategoryPresentation)
    case product(_ product: HomeProductPresentation)
    case banner(_ banner: HomeBannerPresentation)
}

enum HomeSectionItem {
    case campaing, category, product, banner
}

struct HomePresentation: Hashable {
    static func == (lhs: HomePresentation, rhs: HomePresentation) -> Bool {
        lhs.itemType == rhs.itemType
    }
    
    var item: [HomeSection]
    var itemType: HomeSectionItem
}
