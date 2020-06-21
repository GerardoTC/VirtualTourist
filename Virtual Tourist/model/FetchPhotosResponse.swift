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
    let status: String
    let photos: [PhotoInfo]
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "pages"
        case status = "stat"
        case photos = "photo"
    }
}
