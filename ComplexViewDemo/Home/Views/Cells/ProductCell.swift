//
//  ProductCell.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 7.11.2022.
//

import UIKit
import SnapKit

final class ProductCell: UICollectionViewCell {
    static var cellId: String = "ProductCell"
    
    private var containerView = UIView()
    
    private var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var productTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private var productDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private var productPrice: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
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
        containerView.addSubview(productImage)
        containerView.addSubview(productPrice)
        containerView.addSubview(productTitle)
        containerView.addSubview(productDescription)
        
        containerView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalToSuperview()
        }
        
        productImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        productPrice.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(-40)
            $0.trailing.equalTo(productImage.snp.trailing)
            $0.leading.equalTo(productImage.snp.leading)
            $0.height.equalTo(40)
        }
        
        productTitle.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        productDescription.snp.makeConstraints {
            $0.top.equalTo(productTitle.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    func configureCell(model: HomeProductPresentation) {
        productImage.image = UIImage(named: model.imageName)
        productPrice.text = "$ " + model.price
        productTitle.text = model.title
        productDescription.text = model.description
    }
}

