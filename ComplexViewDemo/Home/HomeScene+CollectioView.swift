//
//  HomeScene+CollectioView.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import UIKit
import SnapKit

extension HomeScene {
    func setupViews() {
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: createCompositionalLayout())
        
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    
        collectionView.snp.makeConstraints {
          $0.top.equalTo(view.safeAreaLayoutGuide)
          $0.bottom.trailing.leading.equalToSuperview()
        }
        
        collectionView.register(CampaignCell.self, forCellWithReuseIdentifier: CampaignCell.cellId)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.cellId)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.cellId)
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.cellId)
        
        collectionView.showsHorizontalScrollIndicator = false
    
        collectionView.delegate = self
        createDataSources()
        reloadData()
    }
    
    
    func reloadData() {
      var snapshot = NSDiffableDataSourceSnapshot<HomePresentation, HomeSection>()
      snapshot.appendSections(vm.homeData)
      
      for section in vm.homeData {
        snapshot.appendItems(section.item, toSection: section)
      }
      dataSource?.apply(snapshot)
    }
    
    
    private func createDataSources() {
        dataSource = UICollectionViewDiffableDataSource<HomePresentation, HomeSection>(collectionView: collectionView) { [weak self] _, indexPath, _ in
          guard let self = self else {
            return nil
          }
            let section = self.vm.homeData[indexPath.section]
          let sectionItem = section.item[indexPath.row]
            
            switch sectionItem {
            case .product(let product):
                return self.productCell(product: product, indexPath: indexPath)
            case .banner(let banner):
                return self.bannerCell(banner: banner, indexPath: indexPath)
            case .category(let category):
                return self.categoryCell(category: category, indexPath: indexPath)
            case .campaign(let campaign):
                return self.campaignCell(campaing: campaign, indexPath: indexPath)
            }
        
        }
    }
    
    
    private func campaignCell(campaing: HomeCampaignPresentation, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CampaignCell.cellId, for: indexPath) as? CampaignCell else {
            fatalError("Product cell can't created.")
        }
        cell.configureCell(model: campaing)
        return cell
    }
    
    private func categoryCell(category: HomeCategoryPresentation, indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellId, for: indexPath) as? CategoryCell else {
            fatalError("Product cell can't created.")
        }
        cell.configureCell(model: category)
        return cell
    }
    
    private func productCell(product: HomeProductPresentation, indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.cellId, for: indexPath) as? ProductCell else {
            fatalError("Product cell can't created.")
        }
        cell.configureCell(model: product)
        return cell
    }
    
    
    private func bannerCell(banner: HomeBannerPresentation, indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.cellId, for: indexPath) as? BannerCell else {
            fatalError("Product cell can't created.")
        }
        cell.configureCell(model: banner)
        return cell
    }


    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }

            let section = self.vm.homeData[sectionIndex]
            
            switch section.itemType {
            case .product:
                return self.createProductView()
            case .banner:
                return self.createBannerView()
            case .campaing:
                return self.createCampaignView()
            case .category:
                return self.createCategoryView()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 26
        layout.configuration = config
        return layout
    }
    
    private func createCampaignView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        layoutSection.interGroupSpacing = 5
        return layoutSection
    }
    
    private func createCategoryView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                               heightDimension: .fractionalWidth(0.30))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        layoutSection.interGroupSpacing = 10
        return layoutSection
    }
    
    private func createProductView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(400))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        
        layoutSection.interGroupSpacing = 15
        return layoutSection
    }
    
    private func createBannerView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        layoutSection.interGroupSpacing = 15
        return layoutSection
    }

}

extension HomeScene: UICollectionViewDelegate {
    
}

