//
//  MoiveCollectionViewCell.swift
//  iMovie
//
//  Created by DANIEL CORNWELL on 7/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class MoiveCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            self.movieImageView.image = movie.image
            movieTitleLabel.text = movie.title
            
            self.layer.cornerRadius = 3.0
            self.layer.masksToBounds = true
        }
    }
}
