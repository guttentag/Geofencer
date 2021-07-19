//
//  CoreLocation+Extension.swift
//  Geofencer (iOS)
//
//  Created by Eran Gutentag on 19/07/2021.
//

import CoreLocation

extension CLLocation {
    convenience init(from: CLLocationCoordinate2D) {
        self.init(latitude: from.latitude, longitude: from.longitude)
    }
}
