//
//  PhotoDownloader.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/21/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import Foundation
import UIKit
class PhotoDownloader {
    static let shared = PhotoDownloader()
    
    private let concurrentPhotoQueue = DispatchQueue(label: "virtualTourist.concurrent.queue",
                                                     attributes: .concurrent)
    
    func downloadPhoto(url: URL, completion: @escaping (Data?) -> Void) {
        concurrentPhotoQueue.async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                completion(data)
            }.resume()
        }
    }
    
    func downloadGroup(urls: [URL?], completion: @escaping ([UIImage]) -> Void) {
        let dispatchGroup = DispatchGroup.init()
        var images: [UIImage] = []
        for url in urls {
            dispatchGroup.enter()
            guard let url = url else {
                dispatchGroup.leave()
                continue
            }
            downloadPhoto(url: url) { (data) in
                guard let data = data else {
                    dispatchGroup.leave()
                    return
                }
                guard let image = UIImage(data: data) else {
                    dispatchGroup.leave()
                    return
                }
                images.append(image)
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            completion(images)
        }
        
    }
}
