//
//  CountriesViewController.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class CountriesViewController: BaseViewController {

    let searchBar = UISearchBar()
    let cleanButton = UIButton(type: .system)
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
        collectionView.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: kCountriesCellIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.delegate = self
//        viewModel.getCountriesCases()
        setupSearchBar()
//        setupCollectionViewLayout()
    }
    
    // MARK: - Setup methods
    func setupCollectionViewLayout() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = kSearch
        searchBar.showsCancelButton = false
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = .white
            searchBar.searchTextField.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        }
        searchBar.barTintColor = UIColor.init(netHex: kSearchBarTintColor)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        // TO DO: - Get status bar actual height
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: ((navigationController?.navigationBar.frame.height ?? 44) + 44)).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cleanButton.setTitle(kClean, for: .normal)
        cleanButton.setTitleColor(.gray, for: .normal)
        cleanButton.titleLabel?.font = UIFont(name: "CNNSansDisplay-Medium", size: 16)
        cleanButton.translatesAutoresizingMaskIntoConstraints = false
        searchBar.addSubview(cleanButton)
        cleanButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        cleanButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -8).isActive = true
        cleanButton.leadingAnchor.constraint(equalTo: searchBar.searchTextField.trailingAnchor, constant: 8).isActive = true
//        cleanButton.addTarget(self, action: #selector(cleanSearch), for: .touchUpInside)
    }
}

// MARK: - CollectionView delegate and data source

extension CountriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 24, height: 112)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCountries()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCountriesCellIdentifier, for: indexPath) as? CountryCollectionViewCell {
            cell.bindData(country: viewModel.countryDetails(index: indexPath.row))
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = CountryDetailsViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UISearchBarDelegate

extension CountriesViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
    }
}

// MARK: - Countries View Model Delegate

extension CountriesViewController: CountriesViewModelDelegate {
    
    func requestSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func requestFailure() {
        
    }
}

