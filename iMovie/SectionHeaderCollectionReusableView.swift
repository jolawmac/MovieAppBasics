//
//  SectionHeaderCollectionReusableView.swift
//  iMovie
//
//  Created by DANIEL CORNWELL on 7/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit
    class SectionHeaderCollectionReusableView: UICollectionReusableView
    {
        @IBOutlet weak var sectionTitleLabel: UILabel!
        
        var movie: Movie! {
            didSet {
                sectionTitleLabel.text = movie.section.uppercased()
            }
        }
        
    }

