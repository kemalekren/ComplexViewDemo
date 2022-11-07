//
//  BannerCell.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 7.11.2022.
//

import UIKit
import SnapKit

final class BannerCell: UICollectionViewCell {
    static var cellId: String = "BannerCell"
    
    private var containerView = UIView()
    
    private var bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        self.addSubview(containerView)
        containerView.addSubview(bannerImage)
    

        containerView.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
        }
        
        bannerImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.bottom.trailing.equalToSuperview().offset(-10)
        }
    }
    
    func configureCell(model: HomeBannerPresentation) {
        bannerImage.image = UIImage(named: model.imageName)
    }
}
