//
//  HomeScene.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 6.11.2022.
//

import UIKit

final class HomeScene: UIViewController {
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<HomePresentation, HomeSection>?
    
    var vm: HomeVMProtocol! {
        didSet {
            vm.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        vm.loadData()
        setupViews()
    }
}

extension HomeScene: HomeVMOutputDelegate {
    func refreshUI() {
        
    }
}
