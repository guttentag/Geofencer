//
//  GeofenceRule.swift
//  Geofencer (iOS)
//
//  Created by Eran Gutentag on 18/07/2021.
//

import Foundation
import CoreLocation

class GeofenceRule {
    var id: String?
    let name: String
    let location: CLLocationCoordinate2D
    let radius: Float
    
    init(id: String?, name: String, location: CLLocationCoordinate2D, radius: Float) {
        self.id = id
        self.name = name
        self.location = location
        self.radius = radius
    }
}

extension GeofenceRule: Hashable {
    static func ==(lhs: GeofenceRule, rhs: GeofenceRule) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(location.latitude)
        hasher.combine(location.longitude)
    }
}
