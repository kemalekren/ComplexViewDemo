//
//  CategoryCell.swift
//  ComplexViewDemo
//
//  Created by Kemal Ekren on 7.11.2022.
//

import UIKit
import SnapKit

final class CategoryCell: UICollectionViewCell {
    static var cellId: String = "CategoryCell"
    
    private var containerView = UIView()
    
    private var categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    
    private var categoryTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
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
        containerView.addSubview(categoryImage)
        containerView.addSubview(categoryTitle)
        
        containerView.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
        }
        
        categoryImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(60)
        }
        
        categoryTitle.snp.makeConstraints {
            $0.top.equalTo(categoryImage.snp.bottom).offset(5)
            $0.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    func configureCell(model: HomeCategoryPresentation) {
        categoryImage.image = UIImage(named: model.imageName)
        categoryTitle.text = model.title
    }
}
