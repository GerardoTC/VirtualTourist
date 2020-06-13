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
    @IBOutlet weak var mapHeight: NSLayoutConstraint!
    @IBOutlet weak var containerCollectionView: UIView!
    lazy var photosViewController: UIViewController = {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotosViewController")
    }()
    
    var showImages: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapHeight.constant = self.view.frame.height
    }
    
    
    @IBAction func buttonBarPressed() {
        if showImages {
            showPhotosVC()
        } else {
            hidePhotosVC()
        }
        showImages.toggle()
    }
    
    func showPhotosVC() {
        self.containerPhotosHeight.constant = self.view.bounds.height * 0.5
        self.photosViewController.view.frame = CGRect(x: 0,
                                                      y: 0,
                                                      width: containerCollectionView.frame.width,
                                                      height: containerCollectionView.frame.height)
        self.addChild(photosViewController)
        
        self.containerCollectionView.addSubview(photosViewController.view)
        
        self.photosViewController.didMove(toParent: self)
        
        UIView.animate(withDuration: 0.5, animations: { [unowned self] in
            self.mapHeight.constant = self.view.frame.height * 0.4
            self.view.layoutSubviews()
        })
    }
    
    func hidePhotosVC() {
        UIView.animate(withDuration: 0.5, animations: { [unowned self] in
            self.mapHeight.constant = self.view.frame.height
            self.view.layoutSubviews()
        }) { [unowned self] (finished) in
            self.photosViewController.view.removeFromSuperview()
            self.photosViewController.willMove(toParent: nil)
            self.photosViewController.removeFromParent()
        }
    }
}

