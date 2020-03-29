//
//  CountriesViewController.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class CountriesViewController: BaseViewController {

    let viewModel = CountriesViewModel()
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        collectionViewLayout.minimumLineSpacing = 16
        collectionViewLayout.invalidateLayout()
        return collectionViewLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getCountriesCases()
        setupCollectionViewLayout()
    }
    
    // MARK: - Setup methods
    func setupCollectionViewLayout() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension CountriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 24, height: 156)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCountries()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as? CountryCollectionViewCell {
            cell.bindData(country: viewModel.countryDetails(index: indexPath.row))
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

extension CountriesViewController: CountriesViewModelDelegate {
    
    func requestSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func requestFailure() {
        
    }
}

