//
//  MoviesCollectionViewController.swift
//  iMovie
//
//  Created by DANIEL CORNWELL on 7/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class MoviesCollectionViewController: UICollectionViewController
{
    var store = MoviesStore()
    
    struct Storyboard {
        static let moviesCell = "movieCell"
        static let sectionHeader = "SectionHeader"
    
    }
        
        override func viewDidLoad() {
        super.viewDidLoad()

        }
        
        // MARK: - UICollectionViewDataSource
        
        override func numberOfSections(in collectionView: UICollectionView) -> Int
        {
        return store.numberOfSections
        }
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
        return store.numberOfMovies(inSection: section)
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.moviesCell, for: indexPath) as! MoiveCollectionViewCell
        let movie = store.movieForItem(atIndexPath: indexPath)

        cell.movie = movie
        
        return cell
        }
        
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
        {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeader, for: indexPath) as! SectionHeaderCollectionReusableView
        
        if let movie = store.movieForItem(atIndexPath: indexPath) {
        headerView.movie = movie
        }
        
        return headerView
        }
    }
