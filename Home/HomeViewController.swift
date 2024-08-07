//
//  HomeViewController.swift
//  MoraView
//
//  Created by Şevval Armağan on 7.08.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: Properties
        
    var presenter: IHomePresenter?
    var adapter: HomeAdapter?
    
    // MARK: Views
    
    private lazy var searchBar = UISearchBar()
    
    private lazy var collectionView = UICollectionView(
        frame: view.frame,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension HomeViewController: IHomeView {
    
    func setupNavigationBar() {
        navigationItem.titleView = searchBar
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = adapter
        collectionView.dataSource = adapter
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

