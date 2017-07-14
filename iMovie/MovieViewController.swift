//
//  MovieViewController.swift
//  iMovie
//
//  Created by DANIEL CORNWELL on 7/7/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var yourMovie: UILabel!
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var yourRating: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationBar.isTranslucent = true
   
        titleLable.alpha = 0
        yourMovie.alpha = 0
        yourRating.alpha = 0
        playButton.alpha = 0
        findLabel.alpha = 0
    }
    


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations:{
        self.bgImage.alpha = 0.6
        }) {(true) in
            UIView.animate(withDuration: 1, animations: {
                self.titleLable.alpha = 0.6
            }) {(true) in
            showTitle()
            }
        }
        
        func showTitle() {
            UIView.animate(withDuration: 1, animations: {
            self.titleLable.alpha = 1
            }, completion: {(true) in
                showDesc()
            })
        }
        
        func showDesc() {
            UIView.animate(withDuration: 1, animations: {
            self.yourMovie.alpha = 1
            self.yourRating.alpha = 1
            }) { (true) in
                showButtonAndTest()
            }
        }
        
        func showButtonAndTest() {
            UIView.animate(withDuration: 1, animations: {
                self.playButton.alpha = 1
                self.findLabel.alpha = 1
            })
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
