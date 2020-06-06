//
//  ViewController.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 5/30/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var containerPhotosHeight: NSLayoutConstraint!
    @IBOutlet weak var containerCollectionView: UIView!
    lazy var photosViewController: UIViewController = {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotosViewController")
    }()
    
    var toogled: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonBarPressed() {
        if toogled {
            toogled = false
            UIView.animate(withDuration: 0.5, animations: { [unowned self] in
                self.containerPhotosHeight.constant = 0
                self.view.layoutSubviews()
            }) { [unowned self] (finished) in
                self.photosViewController.view.removeFromSuperview()
                self.photosViewController.willMove(toParent: nil)
                self.photosViewController.removeFromParent()
            }
        } else {
            toogled = true
            self.addChild(photosViewController)
            self.containerCollectionView.addSubview(photosViewController.view)
            self.photosViewController.didMove(toParent: self)
            
            UIView.animate(withDuration: 0.5, animations: { [unowned self] in
                self.containerPhotosHeight.constant = self.view.frame.height/1.4
                self.view.layoutSubviews()
            })
        }
    }
}

