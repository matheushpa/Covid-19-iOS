//
//  WorldwideHeader.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 12/04/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class WorldwideHeader: UITableViewHeaderFooterView {

    let headerLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    // MARK - Setup methods
    
    func setupLayout() {
        contentView.backgroundColor = .white
        setupHeaderLabel()
    }
    
    func setupHeaderLabel() {
        headerLabel.font = UIFont(name: "Montserrat-Bold", size: 28)
        headerLabel.textColor = .black
        headerLabel.text = kWorldwideStatistics
        headerLabel.numberOfLines = 0
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
