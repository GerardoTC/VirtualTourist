//
//  PinAnnotation.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/21/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}
