//
//  PhotosViewController.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/4/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    var items: [PhotoInfo] = [PhotoInfo]()
    var annotation: PinAnnotation!
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "PhotoViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collection.isHidden = true
        loading.isHidden = false
        fetchphotos()
    }
    
    func fetchphotos() {
        FlickrClient.fetchPhotos(perPage: 0,
                            lat: String(describing: annotation.coordinate.latitude),
                            lon: String(describing: annotation.coordinate.longitude)) { [unowned self] (result) in
                                switch result {
                                case .success(let response):
                                    self.downloadPhotos(photos: response)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
        }
    }
    
    func downloadPhotos(photos: FetchPhotosResponse) {
        PhotoDownloader.shared.downloadGroup(placeInfo: photos) { [unowned self] (images) in
            self.updateView(response: images)
        }
    }
    
    func updateView(response: FetchPhotosResponse) {
        collection.isHidden = false
        loading.isHidden = true
        items = response.photos
        collection.reloadData()
    }
    
}


extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoViewCell else {
            return UICollectionViewCell()
        }
        cell.image.image = items[indexPath.row].downloadedImage
        cell.text.text = items[indexPath.row].text
        return cell
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
}
