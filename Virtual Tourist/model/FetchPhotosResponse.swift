//
//  FetchPhotosResponse.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/14/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import Foundation

struct FetchPhotosResponse: Decodable {
    let totalPages: Int
    var photos: [PhotoInfo]
    let currentPage: Int
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "pages"
        case photos = "photo"
        case currentPage = "page"
    }
}

struct PhotosResponse: Decodable {
    let photos: FetchPhotosResponse
    let stat: String
}
