//
//  CampaignCell.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 7.11.2022.
//

import UIKit
import SnapKit

final class CampaignCell: UICollectionViewCell {
    static var cellId: String = "CampaignCell"
    
    private var containerView = UIView()
    
    private var campaignImage: UIImageView = {
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
        containerView.addSubview(campaignImage)
    

        containerView.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
        }
        
        campaignImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.bottom.trailing.equalToSuperview().offset(-10)
        }
    }
    
    func configureCell(model: HomeCampaignPresentation) {
        campaignImage.image = UIImage(named: model.imageName)
    }
}

