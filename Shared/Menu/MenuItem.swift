//
//  MenuItem.swift
//  Geofencer (iOS)
//
//  Created by Eran Gutentag on 19/07/2021.
//

import CoreLocation

struct MenuItem {
    let geofence: GeofenceRule
    
    var id: Int { geofence.hashValue }
    var name: String { geofence.name }
    var location: CLLocationCoordinate2D { geofence.location }
    var radius: Float { geofence.radius }
}

