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
        setupLayout()
    }
    
    // MARK: - Setup methods
    func setupLayout() {
        let fadedView = UIView(frame: CGRect(x: 0, y: 16, width: contentView.frame.width, height: contentView.frame.height))
        let gradient = CAGradientLayer()
        gradient.frame = fadedView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        fadedView.layer.insertSublayer(gradient, at: 0)
        countryImageView.addSubview(fadedView)
        countryImageView.image = UIImage(named: "")
        countryImageView.contentMode = .scaleAspectFill
        countryImageView.layer.cornerRadius = 8.0
        countryImageView.clipsToBounds = true
        countryImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countryImageView)
        countryImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height).isActive = true
        countryImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        countryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        countryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        countryNameLabel.textColor = .white
        countryNameLabel.numberOfLines = 0
        countryNameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        countryNameLabel.adjustsFontSizeToFitWidth = true
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fadedView.addSubview(countryNameLabel)
        countryNameLabel.centerXAnchor.constraint(equalTo: countryImageView.centerXAnchor).isActive = true
        countryNameLabel.centerYAnchor.constraint(equalTo: countryImageView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bindData(country: Cases) {
        countryNameLabel.text = country.country
        guard let flagUrl = URL(string: country.countryInfo?.flag ?? "") else { return }
        ImageManager.shared.downloadImage(from: flagUrl, imageView: countryImageView)
    }
}
