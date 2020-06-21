//
//  FlickrClient.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/14/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import Foundation
//https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=fa6d49ace8c6809c16de3220c06ff4c4&lat=37.768333&lon=-122.450703&radius=8&format=json&nojsoncallback=1&extras=url_s,url_m,url_l&per_page=10
class FlickrClient {
    
    enum Endpoints {
        static var base = "https://www.flickr.com/services/rest/?"
        case photoSearch(lat: String, long: String, page: Int)
        var stringValue: String {
            switch self {
            case let .photoSearch(lat, long, page):
                return FlickrClient.Endpoints.base
                    + "&method=\(FlickrConstants.photosSearch)"
                    + "&api_key=\(FlickrConstants.apiKey)"
                    + "&lat=\(lat)"
                    + "&lon=\(long)"
                    + "&radius=\(FlickrConstants.defaultRadius)"
                    + "&format=json"
                    + "&nojsoncallback=1"
                    + "&extras=url_s,url_m,url_l"
                    + "&per_page=\(FlickrConstants.photosPerPage)"
                    + "&page=\(page)"
            }
        }
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    func fetchPhotos(perPage page: Int, lat: String, lon: String, completion: @escaping (Result<FetchPhotosResponse,FetchPhotosError>) -> Void) {
        let url = FlickrClient.Endpoints.photoSearch(lat: lat, long: lon, page: page).url
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.noDataFound))
                return
            }
            do {
                let fetchResponse = try JSONDecoder().decode(FetchPhotosResponse.self, from: data)
                completion(.success(fetchResponse))
            } catch {
                completion(.failure(.failedFetchData))
            }
        }
    }
}
