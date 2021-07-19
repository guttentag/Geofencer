//
//  RulesRepository.swift
//  Geofencer (iOS)
//
//  Created by Eran Gutentag on 19/07/2021.
//

import Combine
import CoreLocation

class RulesRepository: ObservableObject {
    static let proximityThreashold: Double = 20
    
    @Published private(set) var rules = [GeofenceRule]()
    
    init() {
        // TODO temp:
        save(GeofenceRule(id: UUID().uuidString,name: "Parking", location: CLLocationCoordinate2D(latitude: 32.086850, longitude: 34.972925), radius: 20))
        save(GeofenceRule(id: UUID().uuidString,name: "Work", location: CLLocationCoordinate2D(latitude: 32.072714, longitude: 34.795686), radius: 30))
        save(GeofenceRule(id: UUID().uuidString,name: "מעון תמר", location: CLLocationCoordinate2D(latitude: 32.088954, longitude: 34.970590), radius: 15))
        save(GeofenceRule(id: UUID().uuidString,name: "בית כנסת", location: CLLocationCoordinate2D(latitude: 32.083826, longitude: 34.966694), radius: 50))
        // TODO remove ^^^
    }
    
    /**
     Save (or update) item:
     Override: if `id` already exists, overrride the existing rule.
     Create: If there is is no other rule in proximity of `proximtyThreashold`.
     
     retunr: True - if added/updated. else - otherwise
     */
    @discardableResult
    func save(_ geofence: GeofenceRule) -> Bool {
        if let id = geofence.id, let existingIndex = rules.firstIndex(where: { $0.id == id }) {
                let existing = rules.remove(at: existingIndex)
                geofence.id  = existing.id
                rules.insert(geofence, at: existingIndex)
                return true
        } else {
            if testProximity(geofence) {
                geofence.id = UUID().uuidString
                rules.append(geofence)
                return true
            } else { return false }
        }
    }
}

private extension RulesRepository {
    func testProximity(_ new: GeofenceRule) -> Bool {
        if let _ = rules.first(where: {
            CLLocation(from: $0.location)
                .distance(from: CLLocation(from: new.location))
                .isLess(than: RulesRepository.proximityThreashold)
         }) { return false }
         else { return true }
    }
}
