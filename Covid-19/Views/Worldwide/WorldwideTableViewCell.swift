//
//  WorldwideTableViewCell.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 12/04/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class WorldwideTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let numbersLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    
    func setupLayout() {
        configureLabel(label: titleLabel, fontName: "Montserrat-SemiBold", fontSize: 12, color: kWorldwideTitleColor)
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        configureLabel(label: numbersLabel, fontName: "Montserrat-Bold", fontSize: 24, color: kWorldwideNumbersColor)
        contentView.addSubview(numbersLabel)
        numbersLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        numbersLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        numbersLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
    
    func configureLabel(label: UILabel, fontName: String, fontSize: CGFloat, color: Int) {
        label.textColor = UIColor.init(netHex: color)
        label.font = UIFont(name: fontName, size: fontSize)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func bindData(worldwideCases: Cases) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: worldwideCases.deaths ?? 0))
        numbersLabel.text = formattedNumber
        print(worldwideCases)
    }
}
