//
//  RateMovieViewController.swift
//  iMovie
//
//  Created by DANIEL CORNWELL on 7/6/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class RateMovieViewController: UIViewController {
    
   //Menu
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkFillView: UIView!
    @IBOutlet weak var toggleMenuButton: UIButton!
    
    @IBOutlet weak var trailerBackground: UIView!
    @IBOutlet weak var trailerView: UIView!
    @IBOutlet weak var posterView: UIView!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var posterBackGround: UIView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var card: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        darkFillView.layer.cornerRadius = 25

        posterView.layer.cornerRadius = 10
        trailerView.layer.cornerRadius = 10
        trailerBackground.layer.cornerRadius = 10
        
        card.layer.cornerRadius = 10
        posterBackGround.layer.cornerRadius = 10
        divisor = (view.frame.width / 2) / 0.61
        
        
    }
    

    
    
    
    
    
    
    
   // Menu Button up/down
    @IBAction func toggleMenu(_ sender: UIButton) {
       
        if self.darkFillView.transform == .identity {
        UIView.animate(withDuration: 1, animations: {
            self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11)
            self.menuView.transform = CGAffineTransform(translationX: 0, y: -44)
            self.toggleMenuButton.transform = CGAffineTransform(rotationAngle: radians(180))
        }) { (true) in
        }
    } else {
             UIView.animate(withDuration: 1, animations: {
            self.darkFillView.transform = .identity
                self.menuView.transform = .identity
                self.toggleMenuButton.transform = .identity

        }) { (true) in

        }
    }

        func radians(_ degrees: Double) -> CGFloat {
            return CGFloat(degrees *  .pi /  degrees)
        }
    }
    
    
    // flip Crard
    
     var flippedCard = false
    
    @IBAction func flipCard(_ sender: Any) {
        flippedCard = !flippedCard
        
        let frontView = flippedCard ? posterView : trailerView
        let toView = flippedCard ? trailerView : posterView
        
        UIView.transition(from: frontView!, to: toView!, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])
    }
    
    // Pan Right/Left
    
    var divisor: CGFloat!
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let scale = min(100/abs(xFromCenter), 1)
        // 100/2 = 50/0.61 = 881.967
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "thumb_up")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "thumbs_down")
            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizerState.ended {
            
            if card.center.x < 75 {
             //move to the left side
            UIView.animate(withDuration: 0.3, animations: { 
                card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                card.alpha = 0
            })
                return
            } else if card.center.x > (view.frame.width - 75) {
            // move off to the right side
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0

                })
                return
            }
            
         resetCard()
        }
    }
    @IBAction func reset(_ sender: UIButton) {
        resetCard()
    }
    
    func resetCard(){
        UIView.animate(withDuration: 0.2, animations: {
            self.card.center = self.view.center
            self.thumbImageView.alpha = 0
            self.card.alpha = 1
            self.card.transform = .identity
            
        })
    }
    
}
