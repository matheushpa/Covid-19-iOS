//
//  CountryCollectionViewCell.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 24/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    
    let countryImageView = UIImageView()
    let countryNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellLayout()
    }
    
    // MARK: - Setup methods
    func setupCellLayout() {
        countryImageView.image = UIImage(named: "cnn_banner_placeholder")
        countryImageView.contentMode = .scaleAspectFit
        countryImageView.clipsToBounds = true
        countryImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countryImageView)
        countryImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 24).isActive = true
        countryImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        countryImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        countryImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        setupNewsTitleLayout()
    }
    
    func setupNewsTitleLayout() {
        countryNameLabel.font = UIFont.systemFont(ofSize: 12)
        countryNameLabel.textColor = .black
        countryNameLabel.numberOfLines = 1
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countryNameLabel)
        countryNameLabel.centerXAnchor.constraint(equalTo: countryImageView.centerXAnchor).isActive = true
        countryNameLabel.topAnchor.constraint(equalTo: countryImageView.bottomAnchor, constant: 4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bindData(country: Cases) {
//        newsTitleLabel.text = content.title
        guard let flagUrl = URL(string: country.countryInfo?.flag ?? "") else { return }
        ImageManager.shared.downloadImage(from: flagUrl, imageView: countryImageView)
    }
}
