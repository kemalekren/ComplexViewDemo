//
//  HomeViewModel.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import Foundation

final class HomeViewModel: HomeVMProtocol {
    
    weak var delegate: HomeVMOutputDelegate?
    var homeData: [HomePresentation] = []
    
    func loadData() {
        getAllDummyData()
    }
}

private extension HomeViewModel {
    
    func getAllDummyData() {
        createDummyCampaings()
        createDummyCategories()
        createDummyProducts()
        createDummyBanners()
        
    }
    
    func createDummyCampaings() {
        var campaigns: [CampaignModel] {
            [
                CampaignModel(imageName: "campaign1"),
                CampaignModel(imageName: "campaign2"),
                CampaignModel(imageName: "campaign3"),
                CampaignModel(imageName: "campaign4")
            ]
        }
        
        let campaignPresentation: [HomeCampaignPresentation] = campaigns.map(HomeCampaignPresentation.init)
        homeData.append(HomePresentation(item: campaignPresentation.map { HomeSection.campaign($0) }, itemType: .campaing))
    }
    
    func createDummyCategories() {
        var categories: [CategoriesModel] {
            [
                CategoriesModel(title: "Tech", imageName: "tech"),
                CategoriesModel(title: "Lifestyle", imageName: "lifestyle"),
                CategoriesModel(title: "Food", imageName: "food"),
                CategoriesModel(title: "Home", imageName: "home"),
                CategoriesModel(title: "Toys", imageName: "toys")
            ]
        }
        
        
        let categoriesPresentation: [HomeCategoryPresentation] = categories.map(HomeCategoryPresentation.init)
        homeData.append(HomePresentation(item: categoriesPresentation.map { HomeSection.category($0) }, itemType: .category))
    }
    
    func createDummyProducts() {
        var products: [ProductModel] {
            [
                ProductModel(title: "Computer-1",
                             description: "Amazing Computerm, Super Deal",
                             price: "200",
                             imageName: "computer1"),
                ProductModel(title: "Computer-2",
                             description: "Amazing Computerm, Super Deal",
                             price: "300",
                             imageName: "computer2"),
                ProductModel(title: "Computer-3",
                             description: "Amazing Computerm, Super Deal",
                             price: "250",
                             imageName: "computer3"),
                ProductModel(title: "Computer-4",
                             description: "Amazing Computerm, Super Deal",
                             price: "260",
                             imageName: "computer4"),
                
            ]
        }
        
        let productsPresentation: [HomeProductPresentation] = products.map(HomeProductPresentation.init)
        homeData.append(HomePresentation(item: productsPresentation.map { HomeSection.product($0) }, itemType: .product))
    }
    
    func createDummyBanners() {
        var banners: [BannerModel] {
            [
                BannerModel(imageName: "banner1"),
                BannerModel(imageName: "banner2"),
                BannerModel(imageName: "banner3"),
                BannerModel(imageName: "banner4")
            ]
        }
        
        let bannersPresentation: [HomeBannerPresentation] = banners.map(HomeBannerPresentation.init)
        homeData.append(HomePresentation(item: bannersPresentation.map { HomeSection.banner($0) }, itemType: .banner))
    }
}
