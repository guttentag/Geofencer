//
//  MenuItemView.swift
//  Geofencer (iOS)
//
//  Created by Eran Gutentag on 19/07/2021.
//

import SwiftUI
import CoreLocation
import MapKit

struct MenuItemView: View {
    var item: MenuItem
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name).font(.title).bold()
                Text("radius: \(String(format:"%.0f", item.radius))m")
                HStack {
                    Text("lat: \(String(format: "%.4f", item.location.latitude))")
                    Text("lon: \(String(format: "%.4f", item.location.longitude))")
                }
            }
            Spacer()
            ZStack {
                let region = Binding<MKCoordinateRegion>(
                    get: { MKCoordinateRegion(center: item.location, latitudinalMeters: 500, longitudinalMeters: 500)},
                    set: { _ in })
                Map(coordinateRegion: region)
                    .disabled(true)
                    .frame(maxWidth: 90)
                MapTargetShape()
                    .stroke(Color.red, lineWidth: 0.5)
                    .frame(width: 20, height: 20, alignment: .center)
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let geofence = GeofenceRule(id: "kqwbg", name: "Work", location: CLLocationCoordinate2D(latitude: 32.072714, longitude: 34.795686), radius: 30)
        let item = MenuItem(geofence: geofence)
        MenuItemView(item: item)
            .previewLayout(.fixed(width: 300, height: 70))
    }
    
}
