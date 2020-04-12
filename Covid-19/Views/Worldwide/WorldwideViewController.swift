//
//  WorldwideViewController.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class WorldwideViewController: BaseViewController {
    
    let viewModel = WorldwideViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        tableView.separatorColor = UIColor.init(netHex: kSeparatorColor)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WorldwideTableViewCell.self, forCellReuseIdentifier: kWorldwideIdentifier)
        tableView.register(WorldwideHeader.self, forHeaderFooterViewReuseIdentifier: kWorldwideHeaderIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getWorldwideCases()
        setupTableView()
    }

    // MARK: - Setup methods
    
    func setupTableView() {
         tableView.backgroundColor = .white
         view.addSubview(tableView)
         tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
     }
}

// MARK: - UITableView methods

extension WorldwideViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.rowHeight()
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kWorldwideHeaderIdentifier) as? WorldwideHeader {
            return headerView
        } else {
            return UIView()
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: kWorldwideIdentifier, for: indexPath) as? WorldwideTableViewCell {
            cell.titleLabel.text = kWorldwideTitles[indexPath.row]
            cell.bindData(worldwideCases: viewModel.getCases())
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - Worldwide View Model delegate

extension WorldwideViewController: WorldwideViewModelDelegate {
    
    func requestSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func requestFailure() {
        print("FAILURE")
    }
}
