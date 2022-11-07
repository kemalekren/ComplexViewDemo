//
//  HomeCampaignPresentation.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

struct HomeCampaignPresentation: Hashable {
    var id: String
    var imageName: String
    
    init(campaign: CampaignModel) {
        self.id = campaign.id
        self.imageName = campaign.imageName
    }
    
    static func == (lhs: HomeCampaignPresentation, rhs: HomeCampaignPresentation) -> Bool {
        lhs.id == rhs.id
    }
}
