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
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        
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
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as? UICollectionViewCell else {
            fatalError("Product cell can't created.")
        }
        cell.backgroundColor = .yellow
        return cell
    }
    
    private func categoryCell(category: HomeCategoryPresentation, indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as? UICollectionViewCell else {
            fatalError("Product cell can't created.")
        }
        cell.backgroundColor = .green
        return cell
    }
    
    private func productCell(product: HomeProductPresentation, indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as? UICollectionViewCell else {
            fatalError("Product cell can't created.")
        }
        cell.backgroundColor = .blue
        return cell
    }
    
    
    private func bannerCell(banner: HomeBannerPresentation, indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as? UICollectionViewCell else {
            fatalError("Product cell can't created.")
        }
        cell.backgroundColor = .red
        return cell
    }


    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }

            let section = self.vm.homeData[sectionIndex]
            
            switch section.itemType {
            case .product:
                return self.createDummyView(using: section)
            case .banner:
                return self.createDummyView1(using: section)
            case .campaing:
                return self.createDummyView(using: section)
            case .category:
                return self.createDummyView1(using: section)
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 26
        layout.configuration = config
        return layout
    }
    
    private func createDummyView(using section: HomePresentation) -> NSCollectionLayoutSection  {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(210))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        
        layoutSection.interGroupSpacing = 12
        return layoutSection
    }
    
    private func createDummyView1(using section: HomePresentation) -> NSCollectionLayoutSection  {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(210))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        
        layoutSection.interGroupSpacing = 12
        return layoutSection
    }

}

extension HomeScene: UICollectionViewDelegate {
    
}

