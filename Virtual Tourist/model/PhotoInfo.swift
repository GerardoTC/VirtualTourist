//
//  File.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/13/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import Foundation

struct PhotoInfo: Decodable {
    let text: String
    let id: String
    let sImageURL: String
    let mImageURL: String
    let lImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case text = "title"
        case sImageURL = "url_s"
        case mImageURL = "url_m"
        case lImageURL = "url_l"
        case id
    }
}
