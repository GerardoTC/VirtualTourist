//
//  FetchPhotosError.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/21/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import Foundation

enum FetchPhotosError: Error {
    case noDataFound
    case failedFetchData
}

extension FetchPhotosError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noDataFound:
            return "No data returned"
        case .failedFetchData:
            return "Data is not valid"
        }
    }
}
